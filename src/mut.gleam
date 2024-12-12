import gleam/order.{type Order}
import vec.{type Array, type Imm, type Mut}

// Construction

/// Create an empty array.
@external(erlang, "./mut.erl", "new")
@external(javascript, "./mut.mjs", "new_")
pub fn new() -> Array(Mut, a)

// Conversion

/// Convert a mutable array to an immutable array.
/// This will copy the array - see `to_imm_unsafe` for a non-copying version.
@external(erlang, "./vec.erl", "copy")
@external(javascript, "./vec.mjs", "copy")
pub fn to_imm(arr: Array(Mut, a)) -> Array(Imm, a)

/// Convert a mutable array to an immutable array.
/// This will not copy the array - use with caution.
@external(erlang, "./vec.erl", "noop")
@external(javascript, "./vec.mjs", "noop")
pub fn to_imm_unsafe(arr: Array(Mut, a)) -> Array(Imm, a)

/// Convert an immutable array to a mutable array.
/// This will copy the array - see `to_mut_unsafe` for a non-copying version.
@external(erlang, "./vec.erl", "copy")
@external(javascript, "./vec.mjs", "copy")
pub fn to_mut(arr: Array(Imm, a)) -> Array(Mut, a)

/// Convert an immutable array to a mutable array.
/// This will not copy the array - use with caution.
@external(erlang, "./vec.erl", "noop")
@external(javascript, "./vec.mjs", "noop")
pub fn to_mut_unsafe(arr: Array(Imm, a)) -> Array(Mut, a)

// Mutation

/// Set the element at the given index.
@external(erlang, "./mut.erl", "set")
@external(javascript, "./mut.mjs", "set")
pub fn set(arr: Array(Mut, a), index: Int, value: a) -> Result(Nil, Nil)

/// Set the element at the given index.
/// Undefined behaviour if the index is out of bounds.
@external(erlang, "./mut.erl", "set_unsafe")
@external(javascript, "./mut.mjs", "set_unsafe")
pub fn set_unsafe(arr: Array(Mut, a), index: Int, value: a) -> Nil

/// Push an element to the end of the array.
@external(erlang, "./mut.erl", "append")
@external(javascript, "./mut.mjs", "append")
pub fn append(arr: Array(Mut, a), value: a) -> Nil

/// Pop an element from the end of the array.
@external(erlang, "./mut.erl", "pop")
@external(javascript, "./mut.mjs", "pop")
pub fn pop(arr: Array(Mut, a)) -> Result(a, Nil)

/// Extend the array with the elements from another array.
@external(erlang, "./mut.erl", "extend")
@external(javascript, "./mut.mjs", "extend")
pub fn extend(arr1: Array(Mut, a), arr2: Array(m, a)) -> Nil

/// Sort in-place
@external(erlang, "./mut.erl", "sort")
@external(javascript, "./mut.mjs", "sort")
pub fn sort(arr: Array(Mut, a), on: fn(a) -> b, cmp: fn(b, b) -> Order) -> Nil
