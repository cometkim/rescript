// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

let Mt = require("./mt.js");
let Curry = require("../../lib/js/curry.js");
let Queue = require("../../lib/js/queue.js");
let Genlex = require("../../lib/js/genlex.js");
let Stream = require("../../lib/js/stream.js");
let Caml_int32 = require("../../lib/js/caml_int32.js");
let Caml_exceptions = require("../../lib/js/caml_exceptions.js");

let Parse_error = /* @__PURE__ */Caml_exceptions.create("Stream_parser_test.Parse_error");

function parse(token) {
  let look_ahead = {
    length: 0,
    first: "Nil",
    last: "Nil"
  };
  let token$1 = function (param) {
    if (look_ahead.length !== 0) {
      return Queue.pop(look_ahead);
    }
    try {
      return Curry._1(token, undefined);
    }
    catch (exn){
      return {
        TAG: "Kwd",
        _0: "=="
      };
    }
  };
  let parse_atom = function (param) {
    let n = token$1();
    switch (n.TAG) {
      case "Kwd" :
          if (n._0 === "(") {
            let v = parse_expr_aux(parse_term_aux(parse_atom()));
            let match = token$1();
            if (match.TAG === "Kwd") {
              if (match._0 === ")") {
                return v;
              }
              throw {
                RE_EXN_ID: Parse_error,
                _1: "Unbalanced parens",
                Error: new Error()
              };
            }
            throw {
              RE_EXN_ID: Parse_error,
              _1: "Unbalanced parens",
              Error: new Error()
            };
          }
          Queue.push(n, look_ahead);
          throw {
            RE_EXN_ID: Parse_error,
            _1: "unexpected token",
            Error: new Error()
          };
      case "Int" :
          return n._0;
      default:
        Queue.push(n, look_ahead);
        throw {
          RE_EXN_ID: Parse_error,
          _1: "unexpected token",
          Error: new Error()
        };
    }
  };
  let parse_term_aux = function (e1) {
    let e = token$1();
    if (e.TAG === "Kwd") {
      switch (e._0) {
        case "*" :
            return Math.imul(e1, parse_term_aux(parse_atom()));
        case "/" :
            return Caml_int32.div(e1, parse_term_aux(parse_atom()));
        default:
          Queue.push(e, look_ahead);
          return e1;
      }
    } else {
      Queue.push(e, look_ahead);
      return e1;
    }
  };
  let parse_expr_aux = function (e1) {
    let e = token$1();
    if (e.TAG === "Kwd") {
      switch (e._0) {
        case "+" :
            return e1 + parse_expr_aux(parse_term_aux(parse_atom())) | 0;
        case "-" :
            return e1 - parse_expr_aux(parse_term_aux(parse_atom())) | 0;
        default:
          Queue.push(e, look_ahead);
          return e1;
      }
    } else {
      Queue.push(e, look_ahead);
      return e1;
    }
  };
  let r = parse_expr_aux(parse_term_aux(parse_atom()));
  return [
    r,
    Queue.fold((function (acc, x) {
      return {
        hd: x,
        tl: acc
      };
    }), /* [] */0, look_ahead)
  ];
}

let lexer = Genlex.make_lexer({
  hd: "(",
  tl: {
    hd: "*",
    tl: {
      hd: "/",
      tl: {
        hd: "+",
        tl: {
          hd: "-",
          tl: {
            hd: ")",
            tl: /* [] */0
          }
        }
      }
    }
  }
});

function token(chars) {
  let strm = lexer(chars);
  return function (param) {
    return Stream.next(strm);
  };
}

function l_parse(token) {
  let look_ahead = {
    length: 0,
    first: "Nil",
    last: "Nil"
  };
  let token$1 = function (param) {
    if (look_ahead.length !== 0) {
      return Queue.pop(look_ahead);
    }
    try {
      return Curry._1(token, undefined);
    }
    catch (exn){
      return {
        TAG: "Kwd",
        _0: "=="
      };
    }
  };
  let parse_f_aux = function (_a) {
    while(true) {
      let a = _a;
      let t = token$1();
      if (t.TAG === "Kwd") {
        switch (t._0) {
          case "*" :
              _a = Math.imul(a, parse_f());
              continue;
          case "/" :
              _a = Caml_int32.div(a, parse_f());
              continue;
          default:
            Queue.push(t, look_ahead);
            return a;
        }
      } else {
        Queue.push(t, look_ahead);
        return a;
      }
    };
  };
  let parse_f = function (param) {
    let i = token$1();
    switch (i.TAG) {
      case "Kwd" :
          if (i._0 === "(") {
            let v = parse_t_aux(parse_f_aux(parse_f()));
            let t = token$1();
            if (t.TAG === "Kwd") {
              if (t._0 === ")") {
                return v;
              }
              throw {
                RE_EXN_ID: Parse_error,
                _1: "Unbalanced )",
                Error: new Error()
              };
            }
            throw {
              RE_EXN_ID: Parse_error,
              _1: "Unbalanced )",
              Error: new Error()
            };
          }
          throw {
            RE_EXN_ID: Parse_error,
            _1: "Unexpected token",
            Error: new Error()
          };
      case "Int" :
          return i._0;
      default:
        throw {
          RE_EXN_ID: Parse_error,
          _1: "Unexpected token",
          Error: new Error()
        };
    }
  };
  let parse_t_aux = function (_a) {
    while(true) {
      let a = _a;
      let t = token$1();
      if (t.TAG === "Kwd") {
        switch (t._0) {
          case "+" :
              _a = a + parse_f_aux(parse_f()) | 0;
              continue;
          case "-" :
              _a = a - parse_f_aux(parse_f()) | 0;
              continue;
          default:
            Queue.push(t, look_ahead);
            return a;
        }
      } else {
        Queue.push(t, look_ahead);
        return a;
      }
    };
  };
  let r = parse_t_aux(parse_f_aux(parse_f()));
  return [
    r,
    Queue.fold((function (acc, x) {
      return {
        hd: x,
        tl: acc
      };
    }), /* [] */0, look_ahead)
  ];
}

let suites = {
  contents: /* [] */0
};

let test_id = {
  contents: 0
};

function eq(loc, x, y) {
  test_id.contents = test_id.contents + 1 | 0;
  suites.contents = {
    hd: [
      loc + (" id " + String(test_id.contents)),
      (function (param) {
        return {
          TAG: "Eq",
          _0: x,
          _1: y
        };
      })
    ],
    tl: suites.contents
  };
}

let match = parse(token(Stream.of_string("1 + 2 + (3  - 2) * 3 * 3  - 2 a")));

eq("File \"stream_parser_test.res\", line 141, characters 5-12", [
  match[0],
  match[1]
], [
  10,
  {
    hd: {
      TAG: "Ident",
      _0: "a"
    },
    tl: /* [] */0
  }
]);

eq("File \"stream_parser_test.res\", line 142, characters 5-12", [
  2,
  {
    hd: {
      TAG: "Kwd",
      _0: "=="
    },
    tl: /* [] */0
  }
], parse(token(Stream.of_string("3 - 2  - 1"))));

eq("File \"stream_parser_test.res\", line 143, characters 5-12", [
  0,
  {
    hd: {
      TAG: "Kwd",
      _0: "=="
    },
    tl: /* [] */0
  }
], l_parse(token(Stream.of_string("3 - 2  - 1"))));

Mt.from_pair_suites("Stream_parser_test", suites.contents);

exports.Parse_error = Parse_error;
exports.parse = parse;
exports.lexer = lexer;
exports.token = token;
exports.l_parse = l_parse;
exports.suites = suites;
exports.test_id = test_id;
exports.eq = eq;
/* lexer Not a pure module */
