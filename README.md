SwiftCombination
=================

Ruby's "combination", "permutation" in Swift.

```swift
let combos = combination([0, 1, 2], length: 2)
print(combos) // => [[0, 1], [0, 2], [1, 2]]

let rCombos = repeatedCombination([0, 1, 2], length: 2)
print(rCombos) // => [[0, 0], [0, 1], [0, 2], [1, 1], [1, 2], [2, 2]]



let a = [1, 2, 3, 4]

print(combination(a, length: 1)) // => [[1], [2], [3], [4]]
print(combination(a, length: 2)) // => [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
print(combination(a, length: 3)) // => [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
print(combination(a, length: 4)) // => [[1, 2, 3, 4]]
print(combination(a, length: 0)) // => [[]]
print(combination(a, length: 5)) // => []



// Array method

print(a.combination(3))
// => [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]



// with closure

a.combination(2){ print($0) }
// =>
// [1, 2]
// [1, 3]
// [1, 4]
// [2, 3]
// [2, 4]
// [3, 4]



let chrs = ["h", "e", "l", "o", "!"]
chrs.repeatedCombination(6){ combo in
    if combo.joined(separator: "") == "hello!" { print(combo) }
}
// => [h, e, l, l, o, !]



// => permutation

var chars = ["a", "c", "t"]

//chars.permutation(3){ println($0 }
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

[0, 1].repeatedPermutation(4){ print($0) }
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

## Instalation

### Swift Package Manager

Create a Package.swift file.

```swift
import PackageDescription

let package = Package(
    name: "FooProject",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/all-user/SwiftCombination.git", versions: "0.1.0"..<"0.2.0")
    ]
)
```

And, Use as follows.

```swift
import SwiftCombination
```
