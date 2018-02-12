(* This file has been generated by ocp-ocamlres *)
let root = OCamlRes.Res.([
  Dir ("basic", [
    Dir ("src", [
      File ("demo.ml",
        "\n\
         \n\
         let () = Js.log \"Hello, BuckleScript\"")]) ;
    File ("README.md",
      "\n\
       \n\
       # Build\n\
       ```\n\
       npm run build\n\
       ```\n\
       \n\
       # Watch\n\
       \n\
       ```\n\
       npm run watch\n\
       ```\n\
       \n\
       \n\
       # Editor\n\
       If you use `vscode`, Press `Windows + Shift + B` it will build automatically") ;
    File ("package.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"scripts\": {\n\
      \    \"clean\": \"bsb -clean-world\",\n\
      \    \"build\": \"bsb -make-world\",\n\
      \    \"watch\": \"bsb -make-world -w\"\n\
      \  },\n\
      \  \"keywords\": [\n\
      \    \"BuckleScript\"\n\
      \  ],\n\
      \  \"author\": \"\",\n\
      \  \"license\": \"MIT\",\n\
      \  \"devDependencies\": {\n\
      \    \"bs-platform\": \"^${bsb:bs-version}\"\n\
      \  }\n\
       }") ;
    File ("bsconfig.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"sources\": {\n\
      \    \"dir\" : \"src\",\n\
      \    \"subdirs\" : true\n\
      \  },\n\
      \  \"package-specs\": {\n\
      \    \"module\": \"commonjs\",\n\
      \    \"in-source\": true\n\
      \  },\n\
      \  \"suffix\": \".bs.js\",\n\
      \  \"bs-dependencies\": [\n\
      \      // add your bs-dependencies here \n\
      \  ],\n\
      \  \"warnings\": {\n\
      \    \"error\" : \"+101\"\n\
      \  },\n\
      \  \"refmt\": 3\n\
       }\n\
       ") ;
    Dir (".vscode", [
      File ("tasks.json",
        "{\n\
        \    \"version\": \"${bsb:proj-version}\",\n\
        \    \"command\": \"npm\",\n\
        \    \"options\": {\n\
        \        \"cwd\": \"${workspaceRoot}\"\n\
        \    },\n\
        \    \"isShellCommand\": true,\n\
        \    \"args\": [\n\
        \        \"run\",\n\
        \        \"watch\"\n\
        \    ],\n\
        \    \"showOutput\": \"always\",\n\
        \    \"isBackground\": true,\n\
        \    \"problemMatcher\": {\n\
        \        \"fileLocation\": \"absolute\",\n\
        \        \"owner\": \"ocaml\",\n\
        \        \"watching\": {\n\
        \            \"activeOnStart\": false,\n\
        \            \"beginsPattern\": \">>>> Start compiling\",\n\
        \            \"endsPattern\": \">>>> Finish compiling\"\n\
        \        },\n\
        \        \"pattern\": [\n\
        \            {\n\
        \                \"regexp\": \"^File \\\"(.*)\\\", line (\\\\d+)(?:, characters (\\\\d+)-(\\\\d+))?:$\",\n\
        \                \"file\": 1,\n\
        \                \"line\": 2,\n\
        \                \"column\": 3,\n\
        \                \"endColumn\": 4\n\
        \            },\n\
        \            {\n\
        \                \"regexp\": \"^(?:(?:Parse\\\\s+)?(Warning|[Ee]rror)(?:\\\\s+\\\\d+)?:)?\\\\s+(.*)$\",\n\
        \                \"severity\": 1,\n\
        \                \"message\": 2,\n\
        \                \"loop\": true\n\
        \            }\n\
        \        ]\n\
        \    }\n\
         }")]) ;
    File (".gitignore",
      "*.exe\n\
       *.obj\n\
       *.out\n\
       *.compile\n\
       *.native\n\
       *.byte\n\
       *.cmo\n\
       *.annot\n\
       *.cmi\n\
       *.cmx\n\
       *.cmt\n\
       *.cmti\n\
       *.cma\n\
       *.a\n\
       *.cmxa\n\
       *.obj\n\
       *~\n\
       *.annot\n\
       *.cmj\n\
       *.bak\n\
       lib/bs\n\
       *.mlast\n\
       *.mliast\n\
       .vscode\n\
       .merlin\n\
       .bsb.lock")]) ;
  Dir ("basic-reason", [
    Dir ("src", [
      File ("Demo.re",
        "Js.log(\"Hello, BuckleScript and Reason!\");\n\
         ")]) ;
    File ("README.md",
      "# Basic Reason Template\n\
       \n\
       Hello! This project allows you to quickly get started with Reason and BuckleScript. If you wanted a more sophisticated version, try the `react` template (`bsb -theme react -init .`).\n\
       \n\
       # Build\n\
       ```\n\
       npm run build\n\
       ```\n\
       \n\
       # Build + Watch\n\
       \n\
       ```\n\
       npm run start\n\
       ```\n\
       \n\
       \n\
       # Editor\n\
       If you use `vscode`, Press `Windows + Shift + B` it will build automatically\n\
       ") ;
    File ("package.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"scripts\": {\n\
      \    \"build\": \"bsb -make-world\",\n\
      \    \"start\": \"bsb -make-world -w\",\n\
      \    \"clean\": \"bsb -clean-world\"\n\
      \  },\n\
      \  \"keywords\": [\n\
      \    \"BuckleScript\"\n\
      \  ],\n\
      \  \"author\": \"\",\n\
      \  \"license\": \"MIT\",\n\
      \  \"devDependencies\": {\n\
      \    \"bs-platform\": \"^${bsb:bs-version}\"\n\
      \  }\n\
       }\n\
       ") ;
    File ("bsconfig.json",
      "// This is the configuration file used by BuckleScript's build system bsb. Its documentation lives here: http://bucklescript.github.io/bucklescript/docson/#build-schema.json\n\
       // BuckleScript comes with its own parser for bsconfig.json, which is normal JSON, with the extra support of comments and trailing commas.\n\
       {\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"sources\": {\n\
      \    \"dir\" : \"src\",\n\
      \    \"subdirs\" : true\n\
      \  },\n\
      \  \"package-specs\": {\n\
      \    \"module\": \"commonjs\",\n\
      \    \"in-source\": true\n\
      \  },\n\
      \  \"suffix\": \".bs.js\",\n\
      \  \"bs-dependencies\": [\n\
      \      // add your dependencies here. You'd usually install them normally through `npm install my-dependency`. If my-dependency has a bsconfig.json too, then everything will work seamlessly.\n\
      \  ],\n\
      \  \"warnings\": {\n\
      \    \"error\" : \"+101\"\n\
      \  },\n\
      \  \"namespace\": true,\n\
      \  \"refmt\": 3\n\
       }\n\
       ") ;
    Dir (".vscode", [
      File ("tasks.json",
        "{\n\
        \    \"version\": \"${bsb:proj-version}\",\n\
        \    \"command\": \"npm\",\n\
        \    \"options\": {\n\
        \      \"cwd\": \"${workspaceRoot}\"\n\
        \    },\n\
        \    \"type\": \"shell\",\n\
        \    \"args\": [\"run\", \"start\"],\n\
        \    \"presentation\": {\n\
        \      \"echo\": true,\n\
        \      \"reveal\": \"always\",\n\
        \      \"focus\": false,\n\
        \      \"panel\": \"shared\"\n\
        \    },\n\
        \    \"isBackground\": true,\n\
        \    \"problemMatcher\": {\n\
        \      \"fileLocation\": \"absolute\",\n\
        \      \"owner\": \"ocaml\",\n\
        \      \"background\": {\n\
        \        \"activeOnStart\": false,\n\
        \        \"beginsPattern\": \">>>> Start compiling\",\n\
        \        \"endsPattern\": \">>>> Finish compiling\"\n\
        \      },\n\
        \      \"pattern\": [\n\
        \        {\n\
        \          \"regexp\":\n\
        \            \"^File \\\"(.*)\\\", line (\\\\d+)(?:, characters (\\\\d+)-(\\\\d+))?:$\",\n\
        \          \"file\": 1,\n\
        \          \"line\": 2,\n\
        \          \"column\": 3,\n\
        \          \"endColumn\": 4\n\
        \        },\n\
        \        {\n\
        \          \"regexp\":\n\
        \            \"^(?:(?:Parse\\\\s+)?(Warning|[Ee]rror)(?:\\\\s+\\\\d+)?:)?\\\\s+(.*)$\",\n\
        \          \"severity\": 1,\n\
        \          \"message\": 2,\n\
        \          \"loop\": true\n\
        \        }\n\
        \      ]\n\
        \    }\n\
        \  }\n\
         ")]) ;
    File (".gitignore",
      ".DS_Store\n\
       .merlin\n\
       .bsb.lock\n\
       npm-debug.log\n\
       /lib/bs/\n\
       /node_modules/\n\
       ")]) ;
  Dir ("generator", [
    Dir ("src", [
      File ("test.cpp.ml",
        "\n\
         (* \n\
         #define FS_VAL(name,ty) external name : ty = \"\" [@@bs.module \"fs\"]\n\
         \n\
         \n\
         FS_VAL(readdirSync, string -> string array)\n\
        \ *)\n\
         \n\
         \n\
        \ let ocaml = OCAML") ;
      File ("demo.ml",
        "\n\
         \n\
         let () = Js.log \"Hello, BuckleScript\"")]) ;
    File ("README.md",
      "\n\
       \n\
       # Build\n\
       ```\n\
       npm run build\n\
       ```\n\
       \n\
       # Watch\n\
       \n\
       ```\n\
       npm run watch\n\
       ```\n\
       \n\
       \n\
       # Editor\n\
       If you use `vscode`, Press `Windows + Shift + B` it will build automatically") ;
    File ("package.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"scripts\": {\n\
      \    \"clean\": \"bsb -clean-world\",\n\
      \    \"build\": \"bsb -make-world\",\n\
      \    \"watch\": \"bsb -make-world -w\"\n\
      \  },\n\
      \  \"keywords\": [\n\
      \    \"BuckleScript\"\n\
      \  ],\n\
      \  \"author\": \"\",\n\
      \  \"license\": \"MIT\",\n\
      \  \"devDependencies\": {\n\
      \    \"bs-platform\": \"^${bsb:bs-version}\"\n\
      \  }\n\
       }") ;
    File ("bsconfig.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"sources\": {\n\
      \    \"dir\": \"src\",\n\
      \    \"generators\": [{\n\
      \      \"name\": \"cpp\",\n\
      \      \"edge\": [\"test.ml\", \":\", \"test.cpp.ml\"]\n\
      \    }],\n\
      \    \"subdirs\": true  \n\
      \  },\n\
      \  \"generators\": [{\n\
      \    \"name\" : \"cpp\",\n\
      \    \"command\": \"sed 's/OCAML/3/' $in > $out\"\n\
      \  }],\n\
      \  \"bs-dependencies\" : [\n\
      \  ]\n\
       }") ;
    File (".gitignore",
      "*.exe\n\
       *.obj\n\
       *.out\n\
       *.compile\n\
       *.native\n\
       *.byte\n\
       *.cmo\n\
       *.annot\n\
       *.cmi\n\
       *.cmx\n\
       *.cmt\n\
       *.cmti\n\
       *.cma\n\
       *.a\n\
       *.cmxa\n\
       *.obj\n\
       *~\n\
       *.annot\n\
       *.cmj\n\
       *.bak\n\
       lib/bs\n\
       *.mlast\n\
       *.mliast\n\
       .vscode\n\
       .merlin\n\
       .bsb.lock")]) ;
  Dir ("minimal", [
    Dir ("src", [ File ("main.ml", "")]) ;
    File ("README.md",
      "\n\
      \  # ${bsb:name}") ;
    File ("package.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"scripts\": {\n\
      \    \"clean\": \"bsb -clean-world\",\n\
      \    \"build\": \"bsb -make-world\",\n\
      \    \"start\": \"bsb -make-world -w\"\n\
      \  },\n\
      \  \"keywords\": [\n\
      \    \"BuckleScript\"\n\
      \  ],\n\
      \  \"author\": \"\",\n\
      \  \"license\": \"MIT\",\n\
      \  \"devDependencies\": {\n\
      \    \"bs-platform\": \"^${bsb:bs-version}\"\n\
      \  }\n\
       }") ;
    File ("bsconfig.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"sources\": {\n\
      \      \"dir\": \"src\",\n\
      \      \"subdirs\": true\n\
      \  }\n\
       }") ;
    File (".gitignore",
      ".DS_Store\n\
       .merlin\n\
       .bsb.lock\n\
       npm-debug.log\n\
       /lib/bs/\n\
       /node_modules/")]) ;
  Dir ("node", [
    Dir ("src", [
      File ("demo.ml",
        "\n\
         \n\
         let () = Js.log \"Hello, BuckleScript\"")]) ;
    File ("README.md",
      "\n\
       \n\
       # Build\n\
       ```\n\
       npm run build\n\
       ```\n\
       \n\
       # Watch\n\
       \n\
       ```\n\
       npm run watch\n\
       ```\n\
       \n\
       \n\
       # Editor\n\
       If you use `vscode`, Press `Windows + Shift + B` it will build automatically\n\
       ") ;
    File ("package.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"scripts\": {\n\
      \    \"clean\": \"bsb -clean-world\",\n\
      \    \"build\": \"bsb -make-world\",\n\
      \    \"watch\": \"bsb -make-world -w\"\n\
      \  },\n\
      \  \"keywords\": [\n\
      \    \"BuckleScript\"\n\
      \  ],\n\
      \  \"author\": \"\",\n\
      \  \"license\": \"MIT\",\n\
      \  \"devDependencies\": {\n\
      \    \"bs-platform\": \"^${bsb:bs-version}\"\n\
      \  }\n\
       }") ;
    File ("bsconfig.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"sources\": {\n\
      \      \"dir\": \"src\",\n\
      \      \"subdirs\" : true\n\
      \  },\n\
      \  \"package-specs\": {\n\
      \    \"module\": \"commonjs\",\n\
      \    \"in-source\": true\n\
      \  },\n\
      \  \"suffix\": \".bs.js\",\n\
      \  \"bs-dependencies\": [\n\
      \   ]\n\
       }") ;
    File (".gitignore",
      "*.exe\n\
       *.obj\n\
       *.out\n\
       *.compile\n\
       *.native\n\
       *.byte\n\
       *.cmo\n\
       *.annot\n\
       *.cmi\n\
       *.cmx\n\
       *.cmt\n\
       *.cmti\n\
       *.cma\n\
       *.a\n\
       *.cmxa\n\
       *.obj\n\
       *~\n\
       *.annot\n\
       *.cmj\n\
       *.bak\n\
       lib/bs\n\
       *.mlast\n\
       *.mliast\n\
       .vscode\n\
       .merlin\n\
       .bsb.lock")]) ;
  Dir ("react", [
    File ("webpack.config.js",
      "const path = require('path');\n\
       const outputDir = path.join(__dirname, \"build/\");\n\
       \n\
       module.exports = {\n\
      \  entry: './src/Index.bs.js',\n\
      \  output: {\n\
      \    path: outputDir,\n\
      \    publicPath: outputDir,\n\
      \    filename: 'Index.js',\n\
      \  },\n\
       };\n\
       ") ;
    Dir ("src", [
      File ("Page.re",
        "/* This is the basic component. */\n\
         let component = ReasonReact.statelessComponent(\"Page\");\n\
         \n\
         /* Your familiar handleClick from ReactJS. This mandatorily takes the payload,\n\
        \   then the `self` record, which contains state (none here), `handle`, `reduce`\n\
        \   and other utilities */\n\
         let handleClick = (_event, _self) => Js.log(\"clicked!\");\n\
         \n\
         /* `make` is the function that mandatorily takes `children` (if you want to use\n\
        \   `JSX). `message` is a named argument, which simulates ReactJS props. Usage:\n\
         \n\
        \   `<Page message=\"hello\" />`\n\
         \n\
        \   Which desugars to\n\
         \n\
        \   `ReasonReact.element(Page.make(~message=\"hello\", [||]))` */\n\
         let make = (~message, _children) => {\n\
        \  ...component,\n\
        \  render: (self) =>\n\
        \    <div onClick=(self.handle(handleClick))> (ReasonReact.stringToElement(message)) </div>\n\
         };\n\
         ") ;
      File ("Index.re",
        "ReactDOMRe.renderToElementWithId(<Page message=\"Hello!\" />, \"index\");\n\
         ") ;
      File ("index.html",
        "<!DOCTYPE html>\n\
         <html lang=\"en\">\n\
         <head>\n\
        \  <meta charset=\"UTF-8\">\n\
        \  <title>Pure Reason Example</title>\n\
         </head>\n\
         <body>\n\
        \  <div id=\"index\"></div>\n\
        \  <script src=\"../build/Index.js\"></script>\n\
         </body>\n\
         </html>\n\
         ")]) ;
    File ("README.md",
      "# ${bsb:name}\n\
       \n\
       Run this project:\n\
       \n\
       ```\n\
       npm install\n\
       npm start\n\
       # in another tab\n\
       npm run webpack\n\
       ```\n\
       \n\
       After you see the webpack compilation succeed (the `npm run webpack` step), open up the nested html files in `src/*` (**no server needed!**). Then modify whichever file in `src` and refresh the page to see the changes.\n\
       \n\
       **For more elaborate ReasonReact examples**, please see https://github.com/reasonml-community/reason-react-example\n\
       ") ;
    File ("package.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"scripts\": {\n\
      \    \"build\": \"bsb -make-world\",\n\
      \    \"start\": \"bsb -make-world -w\",\n\
      \    \"clean\": \"bsb -clean-world\",\n\
      \    \"test\": \"echo \\\"Error: no test specified\\\" && exit 1\",\n\
      \    \"webpack\": \"webpack -w\"\n\
      \  },\n\
      \  \"keywords\": [\n\
      \    \"BuckleScript\"\n\
      \  ],\n\
      \  \"author\": \"\",\n\
      \  \"license\": \"MIT\",\n\
      \  \"dependencies\": {\n\
      \    \"react\": \"^15.4.2\",\n\
      \    \"react-dom\": \"^15.4.2\",\n\
      \    \"reason-react\": \">=0.3.0\"\n\
      \  },\n\
      \  \"devDependencies\": {\n\
      \    \"bs-platform\": \"^${bsb:bs-version}\",\n\
      \    \"webpack\": \"^3.8.1\"\n\
      \  }\n\
       }\n\
       ") ;
    File ("bsconfig.json",
      "/* This is the BuckleScript configuration file. Note that this is a comment;\n\
      \  BuckleScript comes with a JSON parser that supports comments and trailing\n\
      \  comma. If this screws with your editor highlighting, please tell us by filing\n\
      \  an issue! */\n\
       {\n\
      \  \"name\": \"react-template\",\n\
      \  \"reason\": {\n\
      \    \"react-jsx\": 2\n\
      \  },\n\
      \  \"sources\": {\n\
      \    \"dir\" : \"src\",\n\
      \    \"subdirs\" : true\n\
      \  },\n\
      \  \"package-specs\": [{\n\
      \    \"module\": \"commonjs\",\n\
      \    \"in-source\": true\n\
      \  }],\n\
      \  \"suffix\": \".bs.js\",\n\
      \  \"namespace\": true,\n\
      \  \"bs-dependencies\": [\n\
      \    \"reason-react\"\n\
      \  ],\n\
      \  \"refmt\": 3,\n\
      \  \"warnings\": {\n\
      \    \"error\": \"+5\"\n\
      \  }\n\
       }\n\
       ") ;
    File (".gitignore",
      ".DS_Store\n\
       .merlin\n\
       .bsb.lock\n\
       npm-debug.log\n\
       /lib/bs/\n\
       /node_modules/")])
])
