// Generated by ReScript, PLEASE EDIT WITH CARE


let v = {
  contents: 0
};

function f(x, x$1) {
  v.contents = v.contents + 1 | 0;
  return x$1 + x$1 | 0;
}

function $$return() {
  return v.contents;
}

function Make(U) {
  let h = (x, x$1) => {
    console.log(f(x$1, x$1));
    return U.say(x$1, x$1);
  };
  return {
    h: h
  };
}

export {
  v,
  f,
  $$return,
  Make,
}
/* No side effect */