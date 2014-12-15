//
//  Array.swift
//  swift_combination
//
//  Created by Keita Okamoto on 2014/12/15.
//  Copyright (c) 2014年 Keita Okamoto. All rights reserved.
//

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