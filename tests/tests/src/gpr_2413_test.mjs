// Generated by ReScript, PLEASE EDIT WITH CARE


function f(x) {
  switch (x.TAG) {
    case "A" :
      let a = x._0;
      if (a.TAG === "P") {
        let a$1 = a._0;
        return a$1 + a$1 | 0;
      }
      let a$2 = a._0;
      return a$2 - a$2 | 0;
    case "B" :
    case "C" :
      break;
  }
  let a$3 = x._0._0;
  return a$3 * a$3 | 0;
}

function ff(c) {
  c.contents = c.contents + 1 | 0;
  let match = (1 + c.contents | 0) + 1 | 0;
  if (match > 3 || match < 0) {
    return 0;
  } else {
    return match + 1 | 0;
  }
}

export {
  f,
  ff,
}
/* No side effect */
