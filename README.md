swift_combination
=================

Ruby's "combination", "permutation" in Swift.

```swift
let combos = combination(arr: [0, 1, 2], length: 2)
print(combos) // => [[0, 1], [0, 2], [1, 2]]

let rCombos = repeatedCombination(arr: [0, 1, 2], length: 2)
print(rCombos) // => [[0, 0], [0, 1], [0, 2], [1, 1], [1, 2], [2, 2]]



let a = [1, 2, 3, 4]

print(combination(arr: a, length: 1)) // => [[1], [2], [3], [4]]
print(combination(arr: a, length: 2)) // => [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
print(combination(arr: a, length: 3)) // => [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
print(combination(arr: a, length: 4)) // => [[1, 2, 3, 4]]
print(combination(arr: a, length: 0)) // => [[]]
print(combination(arr: a, length: 5)) // => []



// Array method

print(a.combination(length: 3))
// => [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]



// with closuer

a.combination(length: 2){ print($0) }
// =>
// [1, 2]
// [1, 3]
// [1, 4]
// [2, 3]
// [2, 4]
// [3, 4]



let chrs = ["h", "e", "l", "o", "!"]
chrs.repeatedCombination(length: 6){ combo in
    if combo.joined(separator: "") == "hello!" { print(combo) }
}
// => [h, e, l, l, o, !]



// => permutation

var chars = ["a", "c", "t"]

//chars.permutation(length: 3){ println($0 }
// => shorthand
chars.permutation{ print($0) }
// =>
// [a, c, t]
// [a, t, c]
// [c, a, t]
// [c, t, a]
// [t, a, c]
// [t, c, a]



// repeated permutation

[0, 1].repeatedPermutation(length: 4){ print($0) }
// =>
// [0, 0, 0, 0]
// [0, 0, 0, 1]
// [0, 0, 1, 0]
// [0, 0, 1, 1]
// [0, 1, 0, 0]
// [0, 1, 0, 1]
// [0, 1, 1, 0]
// [0, 1, 1, 1]
// [1, 0, 0, 0]
// [1, 0, 0, 1]
// [1, 0, 1, 0]
// [1, 0, 1, 1]
// [1, 1, 0, 0]
// [1, 1, 0, 1]
// [1, 1, 1, 0]
// [1, 1, 1, 1]
```
