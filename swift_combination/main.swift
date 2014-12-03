//
//  main.swift
//  swift_combination
//
//  Created by Keita Okamoto on 2014/11/19.
//  Copyright (c) 2014年 Keita Okamoto. All rights reserved.
//

let combos = combination([0, 1, 2], length: 2)
println(combos) // => [[0, 1], [0, 2], [1, 2]]

let rCombos = repeatedCombination([0, 1, 2], length: 2)
println(rCombos) // => [[0, 0], [0, 1], [0, 2], [1, 1], [1, 2], [2, 2]]



let a = [1, 2, 3, 4]

println(combination(a, length: 1)) // => [[1], [2], [3], [4]]
println(combination(a, length: 2)) // => [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
println(combination(a, length: 3)) // => [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
println(combination(a, length: 4)) // => [[1, 2, 3, 4]]
println(combination(a, length: 0)) // => [[]]
println(combination(a, length: 5)) // => []



// Array method

println(a.combination(length: 3))
// => [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]



// with closuer

a.combination(length: 2){ println($0) }
// =>
// [1, 2]
// [1, 3]
// [1, 4]
// [2, 3]
// [2, 4]
// [3, 4]



let chrs = ["h", "e", "l", "o", "!"]
chrs.repeatedCombination(length: 6){ combo in
    if join("", combo) == "hello!" { println(combo) }
}
// => [h, e, l, l, o, !]



// => permutation

var chars = ["a", "c", "t"]

//chars.permutation(length: 3){ println($0 }
// => shorthand
chars.permutation{ println($0) }
// =>
// [a, c, t]
// [a, t, c]
// [c, a, t]
// [c, t, a]
// [t, a, c]
// [t, c, a]



// repeated permutation

[0, 1].repeatedPermutation(length: 4){ println($0) }
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