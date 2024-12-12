import gleam/order.{type Order}

/// Phantom type for describing the mutability of an array
pub type Imm

/// Phantom type for describing the mutability of an array
pub type Mut

/// The type of an array containing `a`.
/// `m` should always be `Imm` or `Mut`, but gleam can't enforce this.
pub type Array(m, a)

// ===== Construction =====

/// Create an empty array.
@external(erlang, "./vec_ffi.erl", "new")
@external(javascript, "./vec_ffi.mjs", "new_")
pub fn new() -> Array(Imm, a)

// ===== Conversion =====

/// Create an array from a list.
@external(erlang, "./vec_ffi.erl", "from_list")
@external(javascript, "./vec_ffi.mjs", "from_list")
pub fn from_list(list: List(a)) -> Array(Imm, a)

/// Create a list from an array.
@external(erlang, "./vec_ffi.erl", "to_list")
@external(javascript, "./vec_ffi.mjs", "to_list")
pub fn to_list(arr: Array(m, a)) -> List(a)

// ===== Indexing =====

/// Get the element at the given index.
@external(erlang, "./vec_ffi.erl", "get")
@external(javascript, "./vec_ffi.mjs", "get")
pub fn get(arr: Array(m, a), index: Int) -> Result(a, Nil)

/// Get the element at the given index.
/// Undefined behaviour if the index is out of bounds.
@external(erlang, "./vec_ffi.erl", "get_unsafe")
@external(javascript, "./vec_ffi.mjs", "get_unsafe")
pub fn get_unsafe(arr: Array(m, a), index: Int) -> a

/// Take elements while a predicate is true.
@external(erlang, "./vec_ffi.erl", "take_while")
@external(javascript, "./vec_ffi.mjs", "take_while")
pub fn take_while(arr: Array(m, a), pred: fn(a) -> Bool) -> Array(m, a)

// ===== Copying =====

/// Copy an array.
@external(erlang, "./vec_ffi.erl", "copy")
@external(javascript, "./vec_ffi.mjs", "copy")
pub fn copy(arr: Array(m, a)) -> Array(m, a)

/// Slice an array.
/// This may or may not copy the slice, depending on platform.
/// To be safe, make sure to `copy` the slice afterwards.
@external(erlang, "./vec_ffi.erl", "slice")
@external(javascript, "./vec_ffi.mjs", "slice")
pub fn slice(arr: Array(m, a), start: Int, end: Int) -> Array(m, a)

// ===== Combining =====

/// Concatenate two arrays.
@external(erlang, "./vec_ffi.erl", "concat")
@external(javascript, "./vec_ffi.mjs", "concat")
pub fn concat(arr1: Array(m, a), arr2: Array(m, a)) -> Array(m, a)

/// Flatten a 2d array.
@external(erlang, "./vec_ffi.erl", "flatten")
@external(javascript, "./vec_ffi.mjs", "flatten")
pub fn flatten(arr: Array(m, Array(m, a))) -> Array(m, a)

// ===== Transforming =====

/// Map a function over the elements of an array.
/// This produces a copy!
@external(erlang, "./vec_ffi.erl", "map")
@external(javascript, "./vec_ffi.mjs", "map")
pub fn map(arr: Array(m, a), fun: fn(a) -> b) -> Array(m, b)

/// Filter an array.
/// This produces a copy!
@external(erlang, "./vec_ffi.erl", "filter")
@external(javascript, "./vec_ffi.mjs", "filter")
pub fn filter(arr: Array(m, a), fun: fn(a) -> Bool) -> Array(m, a)

/// Left-fold a function over the elements of an array.
@external(erlang, "./vec_ffi.erl", "foldl")
@external(javascript, "./vec_ffi.mjs", "foldl")
pub fn fold(arr: Array(m, a), init: b, fun: fn(a, b) -> b) -> b

/// Right-fold a function over the elements of an array.
@external(erlang, "./vec_ffi.erl", "foldr")
@external(javascript, "./vec_ffi.mjs", "foldr")
pub fn fold_right(arr: Array(m, a), init: b, fun: fn(a, b) -> b) -> b

/// Zip two arrays together with a function.
/// Typically `fun` will be `fn(a, b) -> { #(a, b) }`.
@external(erlang, "./vec_ffi.erl", "zip")
@external(javascript, "./vec_ffi.mjs", "zip")
pub fn zip(
  arr1: Array(m, a),
  arr2: Array(m, b),
  fun: fn(a, b) -> c,
) -> Array(m, c)

/// Sort an array by applying `on` to each element and comparing the results.
/// This produces a copy!
@external(erlang, "./vec_ffi.erl", "sort")
@external(javascript, "./vec_ffi.mjs", "sort")
pub fn sort(
  arr: Array(m, b),
  on: fn(a) -> b,
  cmp: fn(b, b) -> Order,
) -> Array(m, a)

// ===== Queries =====

/// Get the length of an array.
@external(erlang, "./vec_ffi.erl", "length")
@external(javascript, "./vec_ffi.mjs", "length")
pub fn length(arr: Array(m, a)) -> Int

/// Check if a predicate is true for all elements of an array.
@external(erlang, "./vec_ffi.erl", "all")
@external(javascript, "./vec_ffi.mjs", "all")
pub fn all(arr: Array(m, a), fun: fn(a) -> Bool) -> Bool

/// Check if a predicate is true for any element of an array.
/// This is short-circuiting.
@external(erlang, "./vec_ffi.erl", "any")
@external(javascript, "./vec_ffi.mjs", "any")
pub fn any(arr: Array(m, a), fun: fn(a) -> Bool) -> Bool

/// Find the index of the first element that satisfies a predicate.
@external(erlang, "./vec_ffi.erl", "find_index")
@external(javascript, "./vec_ffi.mjs", "find_index")
pub fn find_index(arr: Array(m, a), fun: fn(a) -> Bool) -> Result(Int, Nil)
