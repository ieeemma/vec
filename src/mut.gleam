import gleam/order.{type Order}
import vec.{type Array, type Imm, type Mut}

// Construction

/// Create an empty array.
@external(erlang, "./mut_ffi.erl", "new")
@external(javascript, "./mut_ffi.mjs", "new_")
pub fn new() -> Array(Mut, a)

// Conversion

/// Convert a mutable array to an immutable array.
/// This will copy the array - see `to_imm_unsafe` for a non-copying version.
@external(erlang, "./vec_ffi.erl", "copy")
@external(javascript, "./vec_ffi.mjs", "copy")
pub fn to_imm(arr: Array(Mut, a)) -> Array(Imm, a)

/// Convert a mutable array to an immutable array.
/// This will not copy the array - use with caution.
@external(erlang, "./vec_ffi.erl", "noop")
@external(javascript, "./vec_ffi.mjs", "noop")
pub fn to_imm_unsafe(arr: Array(Mut, a)) -> Array(Imm, a)

/// Convert an immutable array to a mutable array.
/// This will copy the array - see `to_mut_unsafe` for a non-copying version.
@external(erlang, "./vec_ffi.erl", "copy")
@external(javascript, "./vec_ffi.mjs", "copy")
pub fn to_mut(arr: Array(Imm, a)) -> Array(Mut, a)

/// Convert an immutable array to a mutable array.
/// This will not copy the array - use with caution.
@external(erlang, "./vec_ffi.erl", "noop")
@external(javascript, "./vec_ffi.mjs", "noop")
pub fn to_mut_unsafe(arr: Array(Imm, a)) -> Array(Mut, a)

// Mutation

/// Set the element at the given index.
@external(erlang, "./mut_ffi.erl", "set")
@external(javascript, "./mut_ffi.mjs", "set")
pub fn set(arr: Array(Mut, a), index: Int, value: a) -> Result(Nil, Nil)

/// Set the element at the given index.
/// Undefined behaviour if the index is out of bounds.
@external(erlang, "./mut_ffi.erl", "set_unsafe")
@external(javascript, "./mut_ffi.mjs", "set_unsafe")
pub fn set_unsafe(arr: Array(Mut, a), index: Int, value: a) -> Nil

/// Push an element to the end of the array.
@external(erlang, "./mut_ffi.erl", "append")
@external(javascript, "./mut_ffi.mjs", "append")
pub fn append(arr: Array(Mut, a), value: a) -> Nil

/// Pop an element from the end of the array.
@external(erlang, "./mut_ffi.erl", "pop")
@external(javascript, "./mut_ffi.mjs", "pop")
pub fn pop(arr: Array(Mut, a)) -> Result(a, Nil)

/// Extend the array with the elements from another array.
@external(erlang, "./mut_ffi.erl", "extend")
@external(javascript, "./mut_ffi.mjs", "extend")
pub fn extend(arr1: Array(Mut, a), arr2: Array(m, a)) -> Nil

/// Sort in-place
@external(erlang, "./mut_ffi.erl", "sort")
@external(javascript, "./mut_ffi.mjs", "sort")
pub fn sort(arr: Array(Mut, a), on: fn(a) -> b, cmp: fn(b, b) -> Order) -> Nil
