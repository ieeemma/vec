import { Ok, Error } from "./gleam.mjs";
import { Gt } from "../gleam_stdlib/gleam/order.mjs";

const Nil = undefined;

export function new_() {
  return [];
}

export function set(arr, idx, value) {
  if (0 <= idx && idx < arr.length) {
    arr[idx] = value;
    return new Ok(Nil);
  } else {
    return new Error(Nil);
  }
}

export function set_unsafe(arr, idx, value) {
  arr[idx] = value;
}

export function append(arr, value) {
  arr.push(value);
}

export function pop(arr) {
  const value = arr.pop();
  return value === undefined ? new Error(Nil) : new Ok(value);
}

export function extend(arr1, arr2) {
  arr1.push(...arr2);
}

export function sort(arr, on, cmp) {
  arr.sort((a, b) => cmp(on(a), on(b)) instanceof Gt);
}
