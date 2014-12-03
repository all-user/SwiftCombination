//
//  combination.swift
//  swift_combination
//
//  Created by Keita Okamoto on 2014/11/19.
//  Copyright (c) 2014年 Keita Okamoto. All rights reserved.
//

private func _combination<T>(arr:[T], length:Int, process:[T] -> ()) -> [T] {
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

private func _repeatedCombination<T>(arr:[T], length:Int, process:[T] -> ()) -> [T] {
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

private func _repeatedPermutation<T>(arr:[T], length:Int, process:[T] -> ()) -> [T] {
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

private func _select<T>(unselected:[Int], selected:[Int], arr:[T], process:[T] -> ()) {
    if unselected.count == 0 {
        process(selected.map{ arr[$0] })
    } else {
        for (i, slct) in enumerate(unselected) {
            var _unselected = unselected, _selected = selected
            _unselected.removeAtIndex(i); _selected.append(slct)
            _select(_unselected, _selected, arr, process)
        }
    }
}

private func _permutation<T>(arr:[T], length:Int, process:[T] -> ()) -> [T] {
    _combination(arr, length) { combo in
        var unselected = (0..<combo.count).map{ $0 }
        _select(unselected, [], arr, process)
    }
    
    return arr
}


public func combination<T>(arr:[T], length:Int? = nil) -> [[T]] {
    let _len = length ?? arr.count
    if _len > arr.count || _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { return [[]] }
    
    var ret = [[T]]()
    _combination(arr, _len){ ret.append($0) }
    
    return ret
}

public func combination<T>(arr:[T], length:Int? = nil, process:[T] -> ()) -> [T] {
    let _len = length ?? arr.count
    if _len > arr.count || _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { process([]); return arr }
    
    return _combination(arr, _len, process)
}


public func repeatedCombination<T>(arr:[T], length:Int? = nil) -> [[T]] {
    let _len = length ?? arr.count
    if _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { return [[]] }
    
    var ret = [[T]]()
    _repeatedCombination(arr, _len){ ret.append($0) }
    
    return ret
}

public func repeatedCombination<T>(arr:[T], length:Int? = nil, process:[T] -> ()) -> [T] {
    let _len = length ?? arr.count
    if _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { process([]); return arr }
    
    return _repeatedCombination(arr, _len, process)
}


public func repeatedPermutation<T>(arr:[T], length:Int? = nil) -> [[T]] {
    let _len = length ?? arr.count
    if _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { return [[]] }
    
    var ret = [[T]]()
    _repeatedPermutation(arr, _len){ ret.append($0) }
    
    return ret
}

public func repeatedPermutaion<T>(arr:[T], length:Int? = nil, process:[T] -> ()) -> [T] {
    let _len = length ?? arr.count
    if _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { process([]); return arr }
    
    return _repeatedPermutation(arr, _len, process)
}


public func permutation<T>(arr:[T], length:Int? = nil) -> [[T]] {
    let _len = length ?? arr.count
    if _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { return [[]] }
    
    var ret = [[T]]()
    _permutation(arr, _len){ ret.append($0) }
    
    return ret
}

public func permutaion<T>(arr:[T], length:Int? = nil, process:[T] -> ()) -> [T] {
    let _len = length ?? arr.count
    if _len < 0 { return [] }
    if arr.isEmpty { return [] }
    if _len == 0 { process([]); return arr }
    
    return _permutation(arr, _len, process)
}



extension Array {
    
    func combination(length:Int? = nil) -> [[Element]] {
        let _len = length ?? self.count
        if _len > self.count || _len < 0 { return [] }
        if _len == 0 { return [[]] }
        
        var ret = [[Element]]()
        _combination(self, _len){ ret.append($0) }
        
        return ret
    }
    
    func combination(length:Int? = nil, process:[Element] -> ()) -> [T] {
        let _len = length ?? self.count
        if _len > self.count || _len < 0 { return [] }
        if _len == 0 { process([]); return self }
        
        return _combination(self, _len, process)
    }
    
    func repeatedCombination(length:Int? = nil) -> [[Element]] {
        let _len = length ?? self.count
        if _len < 0 { return [] }
        if _len == 0 { return [[]] }
        
        var ret = [[Element]]()
        _repeatedCombination(self, _len){ ret.append($0) }
        
        return ret
    }
    
    func repeatedCombination(length:Int? = nil, process:[Element] -> ()) -> [T] {
        let _len = length ?? self.count
        if _len < 0 { return [] }
        if _len == 0 { process([]); return self }
        
        return _repeatedCombination(self, _len, process)
    }
    
    func permutation(length:Int? = nil) -> [[Element]] {
        let _len = length ?? self.count
        if _len > self.count || _len < 0 { return [] }
        if _len == 0 { return [[]] }
        
        var ret = [[Element]]()
        _permutation(self, _len){ ret.append($0) }
        
        return ret
    }
    
    func permutation(length:Int? = nil, process:[Element] -> ()) -> [T] {
        let _len = length ?? self.count
        if _len > self.count || _len < 0 { return [] }
        if _len == 0 { process([]); return self }
        return _permutation(self, _len, process)
    }
    
    func repeatedPermutation(length:Int? = nil) -> [[Element]] {
        let _len = length ?? self.count
        if _len < 0 { return [] }
        if _len == 0 { return [[]] }
        
        var ret = [[Element]]()
        _repeatedPermutation(self, _len){ ret.append($0) }
        
        return ret
    }
    
    func repeatedPermutation(length:Int? = nil, process:[Element] -> ()) -> [T] {
        let _len = length ?? self.count
        if _len < 0 { return [] }
        if _len == 0 { process([]); return self }
        
        return _repeatedPermutation(self, _len, process)
    }
    
}