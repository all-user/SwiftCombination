//
//  functions.swift
//  swift_combination
//
//  Created by Keita Okamoto on 2014/12/15.
//  Copyright (c) 2014年 Keita Okamoto. All rights reserved.
//

@discardableResult
public func combination<T>(arr:[T], length:Int? = nil) -> [[T]] {
    let _len = length ?? arr.count
    if _len > arr.count || _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { return [[]] }
    
    var ret = [[T]]()
    _combination(arr: arr, length: _len){ ret.append($0) }
    
    return ret
}

@discardableResult
public func combination<T>(arr:[T], length:Int? = nil, process:([T]) -> ()) -> [T] {
    let _len = length ?? arr.count
    if _len > arr.count || _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { process([]); return arr }
    
    return _combination(arr: arr, length: _len, process: process)
}

@discardableResult
public func repeatedCombination<T>(arr:[T], length:Int? = nil) -> [[T]] {
    let _len = length ?? arr.count
    if _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { return [[]] }
    
    var ret = [[T]]()
    _repeatedCombination(arr: arr, length: _len){ ret.append($0) }
    
    return ret
}

@discardableResult
public func repeatedCombination<T>(arr:[T], length:Int? = nil, process:([T]) -> ()) -> [T] {
    let _len = length ?? arr.count
    if _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { process([]); return arr }
    
    return _repeatedCombination(arr: arr, length: _len, process: process)
}

@discardableResult
public func repeatedPermutation<T>(arr:[T], length:Int? = nil) -> [[T]] {
    let _len = length ?? arr.count
    if _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { return [[]] }
    
    var ret = [[T]]()
    _repeatedPermutation(arr: arr, length: _len){ ret.append($0) }
    
    return ret
}

@discardableResult
public func repeatedPermutaion<T>(arr:[T], length:Int? = nil, process:([T]) -> ()) -> [T] {
    let _len = length ?? arr.count
    if _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { process([]); return arr }
    
    return _repeatedPermutation(arr: arr, length: _len, process: process)
}

@discardableResult
public func permutation<T>(arr:[T], length:Int? = nil) -> [[T]] {
    let _len = length ?? arr.count
    if _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { return [[]] }
    
    var ret = [[T]]()
    _permutation(arr: arr, length: _len){ ret.append($0) }
    
    return ret
}

@discardableResult
public func permutaion<T>(arr:[T], length:Int? = nil, process:([T]) -> ()) -> [T] {
    let _len = length ?? arr.count
    if _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { process([]); return arr }
    
    return _permutation(arr: arr, length: _len, process: process)
}
