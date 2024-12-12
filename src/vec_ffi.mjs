import { List, Ok, Error } from "./gleam.mjs";
import { Gt } from "../gleam_stdlib/gleam/order.mjs";

const Nil = undefined;

export function new_() {
  return [];
}

export function from_list(list) {
  return list.toArray();
}

export function to_list(arr) {
  return List.fromArray(arr);
}

export function get(arr, idx) {
  return 0 <= idx && idx < arr.length ? new Ok(arr[idx]) : new Error(Nil);
}

export function get_unsafe(arr, idx) {
  return arr[idx];
}

export function take_while(arr, pred) {
  const idx = arr.findIndex((x) => !pred(x));
  return idx === -1
    ? [arr, []]
    : [arr.slice(0, idx), arr.slice(idx, arr.length)];
}

export function copy(arr) {
  return [...arr];
}

export function slice(arr, from, to) {
  return arr.slice(from, to);
}

export function concat(arr1, arr2) {
  return [...arr1, ...arr2];
}

export function flatten(arr) {
  return arr.flat(1);
}

export function map(arr, fun) {
  return arr.map(fun);
}

export function filter(arr, fun) {
  return arr.filter(fun);
}

export function fold(arr, init, fun) {
  return arr.reduce(fun, init);
}

export function fold_right(arr, init, fun) {
  return arr.reduceRight(fun, init);
}

export function zip(arr1, arr2, fun) {
  return arr1.map((x, i) => fun(x, arr2[i]));
}

export function sort(arr, on, cmp) {
  return arr.toSorted((a, b) => cmp(on(a), on(b)) instanceof Gt);
}

export function length(arr) {
  return arr.length;
}

export function all(arr, fun) {
  return arr.every(fun);
}

export function any(arr, fun) {
  return arr.some(fun);
}

export function find_index(arr, fun) {
  const idx = arr.findIndex(fun);
  return idx === -1 ? new Error(Nil) : new Ok(idx);
}
