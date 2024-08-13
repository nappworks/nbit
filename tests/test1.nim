# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

import nbit
# test "can add":
#   check add(5, 5) == 10


suite "Test add proc":
  test "add two numbers":
    check add(2, 3) == 5
    check add(-1, 1) == 0
    check add(-5, -5) == -10

suite "Test BitIndexedTree":
  test "initialize and check length":
    var bit = genBitIndexedTree[int](10)
    check bit.len == 10

  test "adding values and summing them":
    var bit = genBitIndexedTree[int](3)
    bit[0] = 1
    bit[1] = 2
    bit[2] = 3
    check bit.sum(0) == 1
    check bit.sum(1) == 3
    check bit.sum(2) == 6

  test "array access using []":
    var bit = genBitIndexedTree[int](3)
    bit[0] = 1
    bit[1] = 2
    bit[2] = 3
    check bit[0] == 1
    check bit[1] == 2
    check bit[2] == 3

  test "array access using {}":
    var bit = genBitIndexedTree[int](3)
    bit{0} = 1
    bit{1} = 2
    bit{2} = 3
    check bit{0} == 1
    check bit{1} == 2
    check bit{2} == 3

  test "updating values using []=":
    var bit = genBitIndexedTree[int](3)
    bit[0] = 1
    bit[1] = 2
    bit[2] = 3
    bit[1] = 5
    check bit[1] == 5
    check bit.sum(1) == 6

  test "updating values using {}=":
    var bit = genBitIndexedTree[int](3)
    bit[0] = 1
    bit[1] = 2
    bit[2] = 3
    bit{1} = 5
    check bit{1} == 5
    check bit.sum(1) == 5
