//
//  combination.swift
//  swift_combination
//
//  Created by Keita Okamoto on 2014/11/19.
//  Copyright (c) 2014年 Keita Okamoto. All rights reserved.
//

private func _combination<T>(arr:[T], length:Int, process:([T]) -> ()) -> [T] {
    var indices = (0..<length).map{ $0 }
    var k = length-1
    let arrCnt = arr.count
    
    main_roop: for ;; {
        do {
            process(indices.map{ arr[$0] })
        } while ++indices[k] != arrCnt
        
        if length == 1 { break main_roop }
        
        for ;; {
            if indices[k-1] != arrCnt - (length-(k-1)) {
                let t = ++indices[k-1]
                
                for var i=k, j=1; i != length; i++, j++ {
                    indices[i] = t + j
                }
                
                k = length-1
                break
            } else {
                k--
                if k == 0 { break main_roop }
            }
        }
    }
    
    return arr
}

private func _repeatedCombination<T>(arr:[T], length:Int, process:([T]) -> ()) -> [T] {
    var indices = [Int](count: length, repeatedValue: 0)
    var k = length-1
    let arrCnt = arr.count
    
    main_roop: for ;; {
        do {
            process(indices.map{ arr[$0] })
        } while ++indices[k] != arrCnt
        
        if length == 1 { break main_roop }
        
        for ;; {
            if indices[k-1] != arrCnt-1 {
                let t = ++indices[k-1]
                
                for var i=k; i != length; i++ {
                    indices[i] = t
                }
                
                k = length-1
                break
            } else {
                k--
                if k == 0 { break main_roop }
            }
        }
    }
    
    return arr
}


private func _repeatedPermutation<T>(arr:[T], length:Int, process:([T]) -> ()) -> [T] {
    var indices = [Int](count: length, repeatedValue: 0)
    var k = length-1
    let arrCnt = arr.count
    
    main_roop: for ;; {
        do {
            process(indices.map{ arr[$0] })
        } while ++indices[k] != arrCnt
        
        if length == 1 { break main_roop }
        
        for ;; {
            if indices[k-1] != arrCnt-1 {
                ++indices[k-1]
                
                for var i=k; i != length; i++ {
                    indices[i] = 0
                }
                
                k = length-1
                break
            } else {
                k--
                if k == 0 { break main_roop }
            }
        }
    }
    
    return arr
}


public func combination<T>(arr:[T], length:Int) -> [[T]] {
    if length > arr.count || length < 0 { return [] }
    if arr.isEmpty { return [] }
    if length == 0 { return [[]] }
    
    var ret = [[T]]()
    _combination(arr, length){ ret.append($0) }
    
    return ret
}

public func combination<T>(arr:[T], length:Int, process:([T]) -> ()) -> [T] {
    if length > arr.count || length < 0 { return [] }
    if arr.isEmpty { return [] }
    if length == 0 { process([]); return arr }
    
    return _combination(arr, length, process)
}


public func repeatedCombination<T>(arr:[T], length:Int) -> [[T]] {
    if length < 0 { return [] }
    if arr.isEmpty { return [] }
    if length == 0 { return [[]] }
    
    var ret = [[T]]()
    _repeatedCombination(arr, length){ ret.append($0) }
    
    return ret
}

public func repeatedCombination<T>(arr:[T], length:Int, process:([T]) -> ()) -> [T] {
    if length < 0 { return [] }
    if arr.isEmpty { return [] }
    if length == 0 { process([]); return arr }
    return _repeatedCombination(arr, length, process)
}


public func repeatedPermutation<T>(arr:[T], length:Int) -> [[T]] {
    if length < 0 { return [] }
    if arr.isEmpty { return [] }
    if length == 0 { return [[]] }
    
    var ret = [[T]]()
    _repeatedPermutation(arr, length){ ret.append($0) }
    
    return ret
}

public func repeatedPermutaion<T>(arr:[T], length:Int, process:([T]) -> ()) -> [T] {
    if length < 0 { return [] }
    if arr.isEmpty { return [] }
    if length == 0 { process([]); return arr }
    return _repeatedPermutation(arr, length, process)
}



extension Array {
    
    func combination(length:Int) -> [[Element]] {
        if length > self.count || length < 0 { return [] }
        if length == 0 { return [[]] }
        
        var ret = [[Element]]()
        _combination(self, length){ ret.append($0) }
        
        return ret
    }
    
    func combination(length:Int, process:([Element]) -> ()) -> [T] {
        if length > self.count || length < 0 { return [] }
        if length == 0 { process([]); return self }
        return _combination(self, length, process)
    }
    
    func repeatedCombination(length:Int) -> [[Element]] {
        if length < 0 { return [] }
        if length == 0 { return [[]] }
        
        var ret = [[Element]]()
        _repeatedCombination(self, length){ ret.append($0) }
        
        return ret
    }
    
    func repeatedCombination(length:Int, process:([Element]) -> ()) -> [T] {
        if length < 0 { return [] }
        if length == 0 { process([]); return self }
        return _repeatedCombination(self, length, process)
    }
    
    func repeatedPermutation(length:Int) -> [[Element]] {
        if length < 0 { return [] }
        if length == 0 { return [[]] }
        
        var ret = [[Element]]()
        _repeatedPermutation(self, length){ ret.append($0) }
        
        return ret
    }
    
    func repeatedPermutation(length:Int, process:([Element]) -> ()) -> [T] {
        if length < 0 { return [] }
        if length == 0 { process([]); return self }
        return _repeatedPermutation(self, length, process)
    }
}