//
//  functions.swift
//  swift_combination
//
//  Created by Keita Okamoto on 2014/12/15.
//  Copyright (c) 2014年 Keita Okamoto. All rights reserved.
//

@discardableResult
public func combination<T>(_ arr:[T], length:Int? = nil) -> [[T]] {
    let _len = length ?? arr.count
    if _len > arr.count || _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { return [[]] }

    var ret = [[T]]()
    _combination(arr, length: _len){ ret.append($0) }

    return ret
}

@discardableResult
public func combination<T>(_ arr:[T], length:Int? = nil, process:([T]) -> ()) -> [T] {
    let _len = length ?? arr.count
    if _len > arr.count || _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { process([]); return arr }

    return _combination(arr, length: _len, process: process)
}

@discardableResult
public func repeatedCombination<T>(_ arr:[T], length:Int? = nil) -> [[T]] {
    let _len = length ?? arr.count
    if _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { return [[]] }

    var ret = [[T]]()
    _repeatedCombination(arr, length: _len){ ret.append($0) }

    return ret
}

@discardableResult
public func repeatedCombination<T>(_ arr:[T], length:Int? = nil, process:([T]) -> ()) -> [T] {
    let _len = length ?? arr.count
    if _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { process([]); return arr }

    return _repeatedCombination(arr, length: _len, process: process)
}

@discardableResult
public func repeatedPermutation<T>(_ arr:[T], length:Int? = nil) -> [[T]] {
    let _len = length ?? arr.count
    if _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { return [[]] }

    var ret = [[T]]()
    _repeatedPermutation(arr, length: _len){ ret.append($0) }

    return ret
}

@discardableResult
public func repeatedPermutation<T>(_ arr:[T], length:Int? = nil, process:([T]) -> ()) -> [T] {
    let _len = length ?? arr.count
    if _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { process([]); return arr }

    return _repeatedPermutation(arr, length: _len, process: process)
}

@discardableResult
public func permutation<T>(_ arr:[T], length:Int? = nil) -> [[T]] {
    let _len = length ?? arr.count
    if _len > arr.count || _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { return [[]] }

    var ret = [[T]]()
    _permutation(arr, length: _len){ ret.append($0) }

    return ret
}

@discardableResult
public func permutation<T>(_ arr:[T], length:Int? = nil, process:([T]) -> ()) -> [T] {
    let _len = length ?? arr.count
    if _len > arr.count || _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { process([]); return arr }

    return _permutation(arr, length: _len, process: process)
}
