//
//  main.swift
//  swift_combination
//
//  Created by Keita Okamoto on 2014/11/19.
//  Copyright (c) 2014年 Keita Okamoto. All rights reserved.
//

import Foundation



let combos = combination([0, 1, 2], 2)
println(combos) // => [[0, 1], [0, 2], [1, 2]]

let rCombos = repeatedCombination([0, 1, 2], 2)
println(rCombos) // => [[0, 0], [0, 1], [0, 2], [1, 1], [1, 2], [2, 2]]



let a = [1, 2, 3, 4]

println(combination(a, 1)) // => [[1], [2], [3], [4]]
println(combination(a, 2)) // => [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
println(combination(a, 3)) // => [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
println(combination(a, 4)) // => [[1, 2, 3, 4]]
println(combination(a, 0)) // => [[]]
println(combination(a, 5)) // => []



// Array method

println(a.combination(3))
// => [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]



// with closuer

a.combination(2){ println($0) }
// =>
// [1, 2]
// [1, 3]
// [1, 4]
// [2, 3]
// [2, 4]
// [3, 4]



let chrs = ["h", "e", "l", "o", "!"]
chrs.repeatedCombination(6){ (combo:[String]) -> Void in
    if join("", combo) == "hello!" { println(combo) }
}
// => [h, e, l, l, o, !]