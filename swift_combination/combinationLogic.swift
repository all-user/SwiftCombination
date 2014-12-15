//
//  combinationLogic.swift
//  swift_combination
//
//  Created by Keita Okamoto on 2014/12/15.
//  Copyright (c) 2014年 Keita Okamoto. All rights reserved.
//

internal func _combination<T>(arr:[T], length:Int, process:[T] -> ()) -> [T] {
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

internal func _repeatedCombination<T>(arr:[T], length:Int, process:[T] -> ()) -> [T] {
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

internal func _repeatedPermutation<T>(arr:[T], length:Int, process:[T] -> ()) -> [T] {
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

internal func _select<T>(unselected:[Int], selected:[Int], arr:[T], process:[T] -> ()) {
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

internal func _permutation<T>(arr:[T], length:Int, process:[T] -> ()) -> [T] {
    _combination(arr, length) { combo in
        var unselected = (0..<combo.count).map{ $0 }
        _select(unselected, [], arr, process)
    }
    
    return arr
}

