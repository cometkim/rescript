// Generated by ReScript, PLEASE EDIT WITH CARE


function odd(_z) {
  while (true) {
    let z = _z;
    let even = z * z | 0;
    let a = (even + 4 | 0) + even | 0;
    console.log(a.toString());
    _z = 32;
    continue;
  };
}

let even = odd;

export {
  odd,
  even,
}
/* No side effect */
