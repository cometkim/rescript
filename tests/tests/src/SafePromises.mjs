// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Js_promise from "rescript/lib/es6/Js_promise.js";
import * as Js_promise2 from "rescript/lib/es6/Js_promise2.js";

async function nestedPromise(xxx) {
  let xx = await xxx;
  Js_promise2.then(xx, x => Promise.resolve((console.log("Promise2.then", x), undefined)));
  Js_promise2.$$catch(xx, x => {
    console.log("Promise2.catch_", x);
    return Promise.resolve(0);
  });
  Js_promise.then_(x => Promise.resolve((console.log("Promise.then_", x), undefined)), xx);
}

async function create(x) {
  console.log("create", x);
  return x;
}

let xx = create(10);

let xxx = create(xx);

nestedPromise(xxx);

export {
  nestedPromise,
  create,
  xx,
  xxx,
}
/* xx Not a pure module */
