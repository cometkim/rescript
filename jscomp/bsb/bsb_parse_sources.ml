(* Copyright (C) 2015 - 2016 Bloomberg Finance L.P.
 * Copyright (C) 2017 - Hongbo Zhang, Authors of ReScript
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * In addition to the permissions granted to you by the LGPL, you may combine
 * or link a "work that uses the Library" with a publicly distributed version
 * of this file to produce a combined library or application, then distribute
 * that combined work under the terms of your choosing, with no requirement
 * to comply with the obligations normally placed on you by section 4 of the
 * LGPL version 3 (or the corresponding section of a later version of the LGPL
 * should you choose to use a later version).
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA. *)

type t = Bsb_file_groups.t

type source = Bsb_manifest_types.SourceItem.t

type build_generator = Bsb_manifest_types.SourceItem.build_generator

let is_input_or_output (xs : build_generator list) (x : string) =
  Ext_list.exists xs (fun { input; output } ->
      let it_is y = y = x in
      Ext_list.exists input it_is || Ext_list.exists output it_is)

let errorf x fmt = Bsb_exception.errorf ~loc:(Ext_json.loc_of x) fmt

type cxt = {
  package_kind : Bsb_package_kind.t;
  is_dev : bool;
  cwd : string;
  root : string;
  cut_generators : bool;
  traverse : bool;
  ignored_dirs : Set_string.t;
}

(** [public] has a set of modules, we do a sanity check to see if all the listed 
    modules are indeed valid module components
*)
let validate_pub_modules (modules : Set_string.t) (cache : Bsb_db.map) =
  Set_string.iter modules (fun name ->
    if not (Map_string.mem cache name) then
      Bsb_exception.invalid_spec (name ^ " in public is not an existing module")
  )

(** [parsing_source_dir_map cxt input]
    Major work done in this function, 
    assume [not toplevel && not (Bsb_dir_index.is_lib_dir dir_index)]      
    is already checked, so we don't need check it again    
*)

(** This is the only place where we do some removal during scanning,
    configurabl
*)

(********************************************************************)
(* starts parsing *)
let rec parsing_source_dir_map ({ cwd = dir } as cxt)
    (input: source) : Bsb_file_groups.t =
  if Set_string.mem cxt.ignored_dirs dir then Bsb_file_groups.empty
  else
    let cur_globbed_dirs = ref false in
    let has_generators =
      match cxt with
      | {
       cut_generators = false;
       package_kind = Toplevel | Pinned_dependency _;
      } ->
          true
      | { cut_generators = false; package_kind = Dependency _ }
      | { cut_generators = true; _ } ->
          false
    in
    let scanned_generators = input.generators in
    let basename_array =
      lazy
        (cur_globbed_dirs := true;
         Sys.readdir (Filename.concat cxt.root dir))
    in
    let output_sources =
      Ext_list.fold_left
        (Ext_list.flat_map scanned_generators (fun x -> x.output))
        Map_string.empty
        (fun acc o -> Bsb_db_util.add_basename ~dir acc o)
    in
    let sources =
      match input.files with
      | Files_auto ->
          (* We should avoid temporary files *)
          Ext_array.fold_left (Lazy.force basename_array) output_sources
            (fun acc basename ->
              if is_input_or_output scanned_generators basename then acc
              else Bsb_db_util.add_basename ~dir acc basename)
      | Files_set basenames ->
          let basename_array = Array.of_list (Set_string.elements basenames) in
          Ext_array.fold_left basename_array output_sources
            (fun acc basename ->
              Bsb_db_util.add_basename ~dir acc basename
            )
      | Files_predicate { regex; excludes } ->
          let predicate =
            match (regex, excludes) with
            | Some re, [] -> fun name -> Str.string_match re name 0
            | Some re, excludes -> fun name -> Str.string_match re name 0 && not (Ext_list.mem_string excludes name)
            | None, excludes -> fun name -> not (Ext_list.mem_string excludes name)
          in
          Ext_array.fold_left (Lazy.force basename_array) output_sources
            (fun acc basename ->
              if
                is_input_or_output scanned_generators basename
                || not (predicate basename)
              then acc
              else Bsb_db_util.add_basename ~dir acc basename)
    in
    let () =
      match input.public with
      | Export_set modules -> validate_pub_modules modules sources
      | _ -> ()
    in
    (* Doing recursive stuff *)
    let children =
      match (input.subdirs, cxt.traverse) with
      | None, true | Some Recursive_all, _ ->
          let root = cxt.root in
          let parent = Filename.concat root dir in
          Ext_array.fold_left (Lazy.force basename_array) Bsb_file_groups.empty
            (fun origin x ->
              if
                (not (Set_string.mem cxt.ignored_dirs x))
                && Ext_sys.is_directory_no_exn (Filename.concat parent x)
              then
                Bsb_file_groups.merge
                  (parsing_source_dir_map
                     {
                       cxt with
                       cwd =
                         Ext_path.concat cxt.cwd
                           (Ext_path.simple_convert_node_path_to_os_path x);
                       traverse = true;
                     }
                     (Bsb_manifest_types.SourceItem.from_string x))
                  origin
              else origin)
      (* readdir parent avoiding scanning twice *)
      | None, false | Some Recursive_none, _ -> Bsb_file_groups.empty
      | Some (Recursive_source s), _ -> parse_source cxt s
    in
    (* Do some clean up *)
    (* prune_staled_bs_js_files cxt sources ; *)
    Bsb_file_groups.cons
      ~file_group:
        {
          dir;
          sources;
          resources = input.resources;
          public = input.public;
          is_dev = cxt.is_dev;
          generators = (if has_generators then scanned_generators else []);
        }
      ?globbed_dir:(if !cur_globbed_dirs then Some dir else None)
      children

and parse_source ({ package_kind; is_dev; cwd } as cxt)
    (x : source) : t =
    match (package_kind, is_dev) with
    | Dependency _, true -> Bsb_file_groups.empty
    | Dependency _, false | (Toplevel | Pinned_dependency _), _ ->
        parsing_source_dir_map
          {
            cxt with
            cwd =
              Ext_path.concat cwd
                (Ext_path.simple_convert_node_path_to_os_path x.dir);
          }
          x

let scan ~package_kind ~root ~cut_generators ~(* ~namespace  *)
                                             ignored_dirs x : t =
  parse_source
    {
      ignored_dirs;
      package_kind;
      is_dev = false;
      cwd = Filename.current_dir_name;
      root;
      cut_generators;
      (* namespace; *)
      traverse = false;
    }
    x

(* Walk through to do some work *)
type walk_cxt = {
  cwd : string;
  root : string;
  traverse : bool;
  ignored_dirs : Set_string.t;
  gentype_language : string;
}

let rec walk_sources (cxt : walk_cxt) (sources : source list) =
  match sources with
  | Arr { content } ->
      Ext_array.iter content (fun x -> walk_single_source cxt x)
  | x -> walk_single_source cxt x

and walk_single_source cxt (x : source) =
  match x with
  | Str { str = dir } ->
      let dir = Ext_path.simple_convert_node_path_to_os_path dir in
      walk_source_dir_map { cxt with cwd = Ext_path.concat cxt.cwd dir } None
  | Obj { map } -> (
      match map.?(Bsb_build_schemas.dir) with
      | Some (Str { str }) ->
          let dir = Ext_path.simple_convert_node_path_to_os_path str in
          walk_source_dir_map
            { cxt with cwd = Ext_path.concat cxt.cwd dir }
            map.?(Bsb_build_schemas.subdirs)
      | _ -> ())
  | _ -> ()

and walk_source_dir_map (cxt : walk_cxt) subdirs =
  let working_dir = Filename.concat cxt.root cxt.cwd in
  if not (Set_string.mem cxt.ignored_dirs cxt.cwd) then (
    let file_array = Sys.readdir working_dir in
    (* Remove .gen.js/.gen.tsx during clean up *)
    Ext_array.iter file_array (fun file ->
        let is_typescript = cxt.gentype_language = "typescript" in
        if
          (not is_typescript)
          && Ext_string.ends_with file Literals.suffix_gen_js
          || (is_typescript && Ext_string.ends_with file Literals.suffix_gen_tsx)
        then Sys.remove (Filename.concat working_dir file));
    let cxt_traverse = cxt.traverse in
    match (sub_dirs_field, cxt_traverse) with
    | None, true | Some (True _), _ ->
        Ext_array.iter file_array (fun f ->
            if
              (not (Set_string.mem cxt.ignored_dirs f))
              && Ext_sys.is_directory_no_exn (Filename.concat working_dir f)
            then
              walk_source_dir_map
                {
                  cxt with
                  cwd =
                    Ext_path.concat cxt.cwd
                      (Ext_path.simple_convert_node_path_to_os_path f);
                  traverse = true;
                }
                None)
    | None, _ | Some (False _), _ -> ()
    | Some s, _ -> walk_sources cxt s)

(* It makes use of the side effect when [walk_sources], removing suffix_re_js,
   TODO: make it configurable
*)
let clean_re_js root =
  let cwd = Bsb_global_paths.cwd in
  match
    Bsb_config_parse.parse_json ~per_proj_dir:cwd ~warn_legacy_manifest:false
  with
  | _, _, Obj { map } ->
      let ignored_dirs =
        match map.?(Bsb_build_schemas.ignored_dirs) with
        | Some (Arr { content = x }) ->
            Set_string.of_list (Bsb_build_util.get_list_string x)
        | Some _ | None -> Set_string.empty
      in
      let gentype_language =
        match map.?(Bsb_build_schemas.gentype) with
        | None -> ""
        | Some (Obj { map }) -> (
            match map.?(Bsb_build_schemas.gentype_language) with
            | None -> ""
            | Some (Str { str }) -> str
            | Some _ -> "")
        | Some _ -> ""
      in
      Ext_option.iter map.?(Bsb_build_schemas.sources) (fun config ->
          try
            walk_sources
              {
                root;
                traverse = true;
                cwd = Filename.current_dir_name;
                ignored_dirs;
                gentype_language;
              }
              config
          with _ -> ())
  | _, _, _ -> ()
  | exception _ -> ()
