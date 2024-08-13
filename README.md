<!-- # nbit
Bit Indexed Tree (BIT) library written in Nim. -->

# BitIndexedTree Library

This Nim library provides a simple implementation of a **Bit Indexed Tree (Fenwick Tree)**, which is a data structure that efficiently supports prefix sum queries and point updates. The library is generic and works with any numeric type that conforms to `SomeNumber`.

## Overview

A Bit Indexed Tree (BIT) is a data structure that allows efficient update and query operations on a sequence of numbers. It is commonly used for problems involving dynamic cumulative frequency tables or cumulative sums.

Key features of this library include:
- **Efficient updates**: Update an element in O(log n) time.
- **Efficient queries**: Calculate prefix sums in O(log n) time.
- **Generic type support**: Works with any type that supports numeric operations.

## Installation

To use this library, add the source file to your Nim project. No external dependencies are required.

## Usage

### Initialization

You can create a Bit Indexed Tree with a specified maximum size or directly from a sequence of numbers.

```nim
import nbit

# Initialize an empty Bit Indexed Tree with a maximum size of 10
var bit = genBitIndexedTree[int](10)

# Alternatively, initialize from a sequence of numbers
let values = @[1, 2, 3, 4, 5]
var bitFromSeq = toBitIndexedTree(values)
```

### Basic Operations

You can perform various operations such as updating a value, querying the prefix sum, and accessing elements using array-like syntax.

```nim
# Adding value 5 at position 3
bit.add(3, 5)

# Querying the prefix sum up to position 3
let sum = bit.sum(3)
echo sum  # Outputs the sum of values from index 0 to 3

# Accessing elements directly
let valueAtIndex3 = bit[3]
echo valueAtIndex3  # Outputs the value at index 3

# Updating a value at position 2 using array syntax
bit[2] = 7

# Accessing using {} syntax (prefix sum up to position)
let prefixSumAt3 = bit{3}
echo prefixSumAt3  # Outputs the prefix sum up to index 3
```

<!-- ### Iterators

The library provides two iterators for traversing the tree:
- `seekTopDown`: Traverses from a given position downwards.
- `seekBottomUp`: Traverses from a given position upwards.

```nim
# Example usage of seekTopDown
for pos in bit.seekTopDown(3):
  echo pos

# Example usage of seekBottomUp
for pos in bit.seekBottomUp(1):
  echo pos
``` -->

<!-- ## Testing

Unit tests are provided to verify the correctness of the library's methods. These tests can be run using the `unittest` module in Nim. -->

## Contributing

Feel free to open issues or submit pull requests if you find bugs or want to add features.

## License

This project is licensed under the MIT License.


