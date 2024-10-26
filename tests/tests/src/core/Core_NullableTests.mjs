// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Test from "./Test.mjs";

function shouldHandleNullableValues() {
  let tNull = null;
  let tUndefined = undefined;
  let tValue = "hello";
  let tmp;
  tmp = (tNull === null || tNull === undefined) && tNull === null ? true : false;
  Test.run([
    [
      "Core_NullableTests.res",
      7,
      15,
      35
    ],
    "Should handle null"
  ], tmp, (prim0, prim1) => prim0 === prim1, true);
  let tmp$1;
  tmp$1 = (tUndefined === null || tUndefined === undefined) && tUndefined !== null ? true : false;
  Test.run([
    [
      "Core_NullableTests.res",
      17,
      15,
      40
    ],
    "Should handle undefined"
  ], tmp$1, (prim0, prim1) => prim0 === prim1, true);
  let tmp$2;
  tmp$2 = tValue === null || tValue === undefined || tValue !== "hello" ? false : true;
  Test.run([
    [
      "Core_NullableTests.res",
      27,
      15,
      36
    ],
    "Should handle value"
  ], tmp$2, (prim0, prim1) => prim0 === prim1, true);
}

shouldHandleNullableValues();

export {
  shouldHandleNullableValues,
}
/*  Not a pure module */
