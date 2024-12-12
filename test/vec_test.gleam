import gleam/int
import gleeunit
import gleeunit/should

import vec

pub fn main() {
  gleeunit.main()
}

pub fn convert_test() {
  vec.from_list([3, 4, 5])
  |> vec.to_list
  |> should.equal([3, 4, 5])
}

pub fn index_test() {
  vec.from_list([3, 4, 5])
  |> vec.get(0)
  |> should.equal(Ok(3))
  vec.from_list([3, 4, 5])
  |> vec.get(3)
  |> should.equal(Error(Nil))
  vec.from_list([3, 4, 5])

  vec.from_list([3, 4, 5])
  |> vec.get_unsafe(0)
  |> should.equal(3)
}

pub fn take_while_test() {
  let #(a, b) =
    vec.from_list([3, 4, 5, 6, 7, 8])
    |> vec.take_while(fn(x) { x < 6 })
  a |> vec.to_list |> should.equal([3, 4, 5])
  b |> vec.to_list |> should.equal([6, 7, 8])

  let #(a, b) =
    vec.from_list([3, 4, 5, 6, 7, 8])
    |> vec.take_while(fn(x) { x < 10 })
  a |> vec.to_list |> should.equal([3, 4, 5, 6, 7, 8])
  b |> vec.to_list |> should.equal([])
}

pub fn copy_test() {
  let a = vec.from_list([3, 4, 5])
  let b = vec.copy(a)
  a |> vec.to_list |> should.equal([3, 4, 5])
  b |> vec.to_list |> should.equal([3, 4, 5])
}

pub fn slice_test() {
  vec.from_list([3, 4, 5, 6, 7, 8])
  |> vec.slice(1, 4)
  |> vec.to_list
  |> should.equal([4, 5, 6])

  vec.from_list([3, 4, 5, 6, 7, 8])
  |> vec.slice(1, 10)
  |> vec.to_list
  |> should.equal([4, 5, 6, 7, 8])
}

pub fn concat_test() {
  vec.from_list([3, 4, 5])
  |> vec.concat(vec.from_list([6, 7, 8]))
  |> vec.to_list
  |> should.equal([3, 4, 5, 6, 7, 8])
}

pub fn flatten_test() {
  vec.from_list([vec.from_list([3, 4, 5]), vec.from_list([6, 7, 8])])
  |> vec.flatten
  |> vec.to_list
  |> should.equal([3, 4, 5, 6, 7, 8])
}

pub fn map_test() {
  vec.from_list([3, 4, 5])
  |> vec.map(fn(x) { x + 1 })
  |> vec.to_list
  |> should.equal([4, 5, 6])
}

pub fn filter_test() {
  vec.from_list([3, 4, 5, 6, 7, 8])
  |> vec.filter(fn(x) { x % 2 == 0 })
  |> vec.to_list
  |> should.equal([4, 6, 8])
}

pub fn fold_test() {
  vec.from_list([3, 4, 5])
  |> vec.fold(0, fn(acc, x) { x + acc })
  |> should.equal(12)
}

pub fn fold_right_test() {
  // Test that demonstrates the right-order fold
  vec.from_list(["a", "b", "c", "d"])
  |> vec.fold_right("", fn(x, acc) { "(" <> acc <> x <> ")" })
  |> should.equal("(a(b(c(d))))")
}

pub fn zip_test() {
  vec.from_list([3, 4, 5])
  |> vec.zip(vec.from_list([6, 7, 8]), fn(x, y) { x + y })
  |> vec.to_list
  |> should.equal([9, 11, 13])
}

pub fn sort_test() {
  vec.from_list([3, 7, 5, 6, 4, 8])
  |> vec.sort(fn(x) { x }, int.compare)
  |> vec.to_list
  |> should.equal([3, 4, 5, 6, 7, 8])

  vec.from_list([#(3, "a"), #(7, "b"), #(5, "c"), #(2, "d")])
  |> vec.sort(fn(x: #(Int, String)) { x.0 }, int.compare)
  |> vec.to_list
  |> should.equal([#(2, "d"), #(3, "a"), #(5, "c"), #(7, "b")])
}

pub fn length_test() {
  vec.from_list([3, 4, 5])
  |> vec.length
  |> should.equal(3)

  vec.from_list([])
  |> vec.length
  |> should.equal(0)
}

pub fn all_test() {
  vec.from_list([3, 4, 5])
  |> vec.all(fn(x) { x > 2 })
  |> should.equal(True)

  vec.from_list([3, 4, 5])
  |> vec.all(fn(x) { x > 3 })
  |> should.equal(False)

  vec.from_list([])
  |> vec.all(fn(x) { x > 2 })
  |> should.equal(True)
}

pub fn any_test() {
  vec.from_list([3, 4, 5])
  |> vec.any(fn(x) { x > 4 })
  |> should.equal(True)

  vec.from_list([3, 4, 5])
  |> vec.any(fn(x) { x > 5 })
  |> should.equal(False)

  vec.from_list([])
  |> vec.any(fn(x) { x > 2 })
  |> should.equal(False)
}

pub fn find_index_test() {
  vec.from_list([3, 4, 5])
  |> vec.find_index(fn(x) { x > 4 })
  |> should.equal(Ok(2))

  vec.from_list([3, 4, 5])
  |> vec.find_index(fn(x) { x > 5 })
  |> should.equal(Error(Nil))
}
