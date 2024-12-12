import gleam/int
import gleeunit/should

import mut
import vec

pub fn set_test() {
  let arr = vec.from_list([3, 4, 5]) |> mut.to_mut_unsafe
  mut.set_unsafe(arr, 1, 10)
  arr |> vec.to_list |> should.equal([3, 10, 5])
}

pub fn append_test() {
  let arr = vec.from_list([3, 4, 5]) |> mut.to_mut_unsafe
  mut.append(arr, 10)
  arr |> vec.to_list |> should.equal([3, 4, 5, 10])
}

pub fn pop_test() {
  let arr = vec.from_list([3, 4, 5]) |> mut.to_mut_unsafe
  mut.pop(arr) |> should.equal(Ok(5))
  arr |> vec.to_list |> should.equal([3, 4])

  let arr = mut.new()
  mut.pop(arr) |> should.equal(Error(Nil))
}

pub fn extend_test() {
  let arr = vec.from_list([3, 4, 5]) |> mut.to_mut_unsafe
  let arr2 = vec.from_list([6, 7, 8])
  mut.extend(arr, arr2)
  arr |> vec.to_list |> should.equal([3, 4, 5, 6, 7, 8])
}

pub fn sort_test() {
  let arr = vec.from_list([3, 4, 5, 1, 2]) |> mut.to_mut_unsafe
  mut.sort(arr, fn(x) { x }, int.compare)
  arr |> vec.to_list |> should.equal([1, 2, 3, 4, 5])
}
