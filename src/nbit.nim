## This Nim library provides a simple implementation of a **Bit Indexed Tree (Fenwick Tree)**,
## which is a data structure that efficiently supports prefix sum queries and point updates.
## The library is generic and works with any numeric type that conforms to `SomeNumber`.

type
  BitIndexedTree*[T: SomeNumber] = ref object
    ## BitIndexedTree is a reference object that stores an array of values `vals`.
    ## The array size is determined during initialization and supports numeric types (`SomeNumber`).
    vals: seq[T]

func len*[T: SomeNumber](bit: BitIndexedTree[T]): int =
  ## Returns the length of the BitIndexedTree.
  ## The length is determined by subtracting 1 from the length of the underlying `vals` sequence.
  return (bit.vals.len - 1)

func max*[T: SomeNumber](bit: BitIndexedTree[T]): int =
  ## Returns the maximum index of the BitIndexedTree.
  ## This function is identical to `len` but may be used for clarity when referring to the maximum index.
  return (bit.vals.len - 1)

func init[T: SomeNumber](bit: var BitIndexedTree[T], max: int) =
  ## Initializes a BitIndexedTree with a given maximum index.
  ## The `max` parameter determines the size of the internal `vals` sequence.
  bit = new BitIndexedTree[T]
  bit.vals = newSeq[T](max + 1) 

func genBitIndexedTree*[T: SomeNumber](max: int): BitIndexedTree[T] =
  ## Generates a new BitIndexedTree with a specified maximum index.
  ## This function is a convenience wrapper for the `init` procedure.
  result.init(max)

iterator seekTopDown[T: SomeNumber](bit: BitIndexedTree[T], pos: int): int =
  ## Iterator that traverses the tree from a given position downwards.
  ## It yields positions by subtracting the least significant bit from the current position.
  var vPos = pos
  while vPos > 0:
    yield vPos
    vPos -= vPos and - vPos

iterator seekBottomUp[T: SomeNumber](bit: BitIndexedTree[T], pos: int): int =
  ## Iterator that traverses the tree from a given position upwards.
  ## It yields positions by adding the least significant bit to the current position.
  var vPos = pos
  while vPos <= (bit.max):
    yield vPos
    vPos += vPos and - vPos

func add*[T: SomeNumber](bit: var BitIndexedTree[T], pos: int, val: T) =
  ## Adds a value to the BitIndexedTree at a specific position.
  ## The `pos` parameter is the zero-based index where the value should be added.
  ## The value is added to the positions returned by `seekBottomUp`.
  let vPos = pos + 1
  for i in bit.seekBottomUp(vPos):
    bit.vals[i] += val

func sum*[T: SomeNumber](bit: BitIndexedTree[T], pos: int): T =
  ## Calculates the prefix sum up to a specified position.
  ## The `pos` parameter is the zero-based index up to which the sum is calculated.
  ## The sum is computed using the positions returned by `seekTopDown`.
  let vPos = pos + 1
  for i in bit.seekTopDown(vPos):
    result += bit.vals[i]

func toBitIndexedTree*[T: SomeNumber](vals: openArray[T]): BitIndexedTree[T] =
  ## Converts a sequence of values into a BitIndexedTree.
  ## This function initializes a tree and adds each value from the input sequence.
  result.init(vals.len)
  for i, val in vals:
    result.add(i, val)

func `[]`*[T: SomeNumber](bit: BitIndexedTree[T], pos: int): T =
  ## Array-like access to the BitIndexedTree values.
  ## The `[]` operator returns the value at the specified position.
  ## If `pos` is zero, it returns the sum up to that position; otherwise, it returns the difference between sums.
  let prePos = pos - 1
  if prePos == -1:
    return bit.sum(pos)
  else:
    return bit.sum(pos) - bit.sum(prePos)

func `[]=`*[T: SomeNumber](bit: var BitIndexedTree[T], pos: int, val: T) =
  ## Array-like assignment to update values in the BitIndexedTree.
  ## The `[]=` operator updates the value at the specified position by first negating the current value.
  bit.add(pos,  -1 * bit[pos])
  bit.add(pos,  val)

func `{}`*[T: SomeNumber](bit: BitIndexedTree[T], pos: int): T =
  ## Bracket access for prefix sums.
  ## The `{}` operator returns the prefix sum up to the specified position.
  return bit.sum(pos)

func `{}=`*[T: SomeNumber](bit: var BitIndexedTree[T], pos: int, val: T) =
  ## Bracket assignment for prefix sum updates.
  ## The `{}`= operator updates the value at the specified position using prefix sums.
  let prePos = pos - 1
  if prePos == -1:
    bit[pos] = val
  else:
    bit[pos] = val - bit{prePos}