//
//  Array.swift
//  swift_combination
//
//  Created by Keita Okamoto on 2014/12/15.
//  Copyright (c) 2014年 Keita Okamoto. All rights reserved.
//

extension Array {
    
    @discardableResult
    func combination(length:Int? = nil) -> [[Element]] {
        let _len = length ?? self.count
        if _len > self.count || _len < 0 { return [] }
        if _len == 0 { return [[]] }
        
        var ret = [[Element]]()
        _combination(arr: self, length: _len){ ret.append($0) }
        
        return ret
    }
    
    @discardableResult
    func combination(length:Int? = nil, process:([Element]) -> ()) -> [Element] {
        let _len = length ?? self.count
        if _len > self.count || _len < 0 { return [] }
        if _len == 0 { process([]); return self }
        
        return _combination(arr: self, length: _len, process: process)
    }
    
    @discardableResult
    func repeatedCombination(length:Int? = nil) -> [[Element]] {
        let _len = length ?? self.count
        if _len < 0 { return [] }
        if _len == 0 { return [[]] }
        
        var ret = [[Element]]()
        _repeatedCombination(arr: self, length: _len){ ret.append($0) }
        
        return ret
    }
    
    @discardableResult
    func repeatedCombination(length:Int? = nil, process:([Element]) -> ()) -> [Element] {
        let _len = length ?? self.count
        if _len < 0 { return [] }
        if _len == 0 { process([]); return self }
        
        return _repeatedCombination(arr: self, length: _len, process: process)
    }
    
    @discardableResult
    func permutation(length:Int? = nil) -> [[Element]] {
        let _len = length ?? self.count
        if _len > self.count || _len < 0 { return [] }
        if _len == 0 { return [[]] }
        
        var ret = [[Element]]()
        _permutation(arr: self, length: _len){ ret.append($0) }
        
        return ret
    }
    
    @discardableResult
    func permutation(length:Int? = nil, process:([Element]) -> ()) -> [Element] {
        let _len = length ?? self.count
        if _len > self.count || _len < 0 { return [] }
        if _len == 0 { process([]); return self }
        return _permutation(arr: self, length: _len, process: process)
    }
    
    @discardableResult
    func repeatedPermutation(length:Int? = nil) -> [[Element]] {
        let _len = length ?? self.count
        if _len < 0 { return [] }
        if _len == 0 { return [[]] }
        
        var ret = [[Element]]()
        _repeatedPermutation(arr: self, length: _len){ ret.append($0) }
        
        return ret
    }
    
    @discardableResult
    func repeatedPermutation(length:Int? = nil, process:([Element]) -> ()) -> [Element] {
        let _len = length ?? self.count
        if _len < 0 { return [] }
        if _len == 0 { process([]); return self }
        
        return _repeatedPermutation(arr: self, length: _len, process: process)
    }
    
}
