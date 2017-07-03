//
//  combinationLogic.swift
//  swift_combination
//
//  Created by Keita Okamoto on 2014/12/15.
//  Copyright (c) 2014年 Keita Okamoto. All rights reserved.
//

@discardableResult
internal func _combination<T>(_ arr:[T], length:Int, process:([T]) -> ()) -> [T] {
    var indices = (0..<length).map{ $0 }
    var k = length-1
    let arrCnt = arr.count
    
    main_loop: while true {
        repeat {
            process(indices.map{ arr[$0] })
            indices[k]+=1
        } while indices[k] != arrCnt
        
        if length == 1 { break main_loop }
        
        while true {
            if indices[k-1] != arrCnt - (length-(k-1)) {
                indices[k-1]+=1
                let t = indices[k-1]
                
                var i=k, j=1
                while i != length {
                    indices[i] = t + j
                    i+=1
                    j+=1
                }
                
                k = length-1
                break
            } else {
                k-=1
                if k == 0 { break main_loop }
            }
        }
    }
    
    return arr
}

@discardableResult
internal func _repeatedCombination<T>(_ arr:[T], length:Int, process:([T]) -> ()) -> [T] {
    var indices = [Int](repeating: 0, count: length)
    var k = length-1
    let arrCnt = arr.count
    
    main_loop: while true {
        repeat {
            process(indices.map{ arr[$0] })
            indices[k]+=1
        } while indices[k] != arrCnt
        
        if length == 1 { break main_loop }
        
        while true {
            if indices[k-1] != arrCnt-1 {
                indices[k-1]+=1
                let t = indices[k-1]
                
                var i=k
                while i != length {
                    indices[i] = t
                    i+=1
                }
                
                k = length-1
                break
            } else {
                k-=1
                if k == 0 { break main_loop }
            }
        }
    }
    
    return arr
}

@discardableResult
internal func _repeatedPermutation<T>(_ arr:[T], length:Int, process:([T]) -> ()) -> [T] {
    var indices = [Int](repeating: 0, count: length)
    var k = length-1
    let arrCnt = arr.count
    
    main_loop: while true {
        repeat {
            process(indices.map{ arr[$0] })
            indices[k]+=1
        } while indices[k] != arrCnt
        
        if length == 1 { break main_loop }
        
        while true {
            if indices[k-1] != arrCnt-1 {
                indices[k-1]+=1
                
                var i=k
                while i != length {
                    indices[i] = 0
                    i+=1
                }
                
                k = length-1
                break
            } else {
                k-=1
                if k == 0 { break main_loop }
            }
        }
    }
    
    return arr
}

internal func _select<T>(_ unselected:[Int], selected:[Int], arr:[T], process:([T]) -> ()) {
    if unselected.count == 0 {
        process(selected.map{ arr[$0] })
    } else {
        for (i, slct) in unselected.enumerated() {
            var _unselected = unselected, _selected = selected
            _unselected.remove(at: i); _selected.append(slct)
            _select(_unselected, selected: _selected, arr: arr, process: process)
        }
    }
}

@discardableResult
internal func _permutation<T>(_ arr:[T], length:Int, process:([T]) -> ()) -> [T] {
    _combination(arr, length: length) { combo in
        let unselected = (0..<combo.count).map{ $0 }
        _select(unselected, selected: [], arr: arr, process: process)
    }
    
    return arr
}

