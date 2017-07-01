//
//  CombinationTests.swift
//  SwiftCombination
//
//  Created by Keita Okamoto on 2017/07/01.
//
//
import XCTest

final class GlobalCombinationTests: SwiftCombinationTests {}

extension GlobalCombinationTests {
    func testGlobalCombinationImplicitLength() {
        let actual = combination([0, 1, 2])
        let expected = [[0, 1, 2]]
        zip(actual, expected).forEach { XCTAssertEqual($0, $1) }
    }
    
    func testGlobalCombinationArgLengthLessThanCollectionLength() {
        let actual = combination([0, 1, 2], length: 2)
        let expected = [[0, 1], [0, 2], [1, 2]]
        zip(actual, expected).forEach { XCTAssertEqual($0, $1) }
    }
    
    func testGlobalCombinationArgLengthGreaterThanCollectionLength() {
        let actual = combination([0, 1, 2], length: 4)
        let expected = [[0, 1, 2]]
        zip(actual, expected).forEach { XCTAssertEqual($0, $1) }
    }
    
    static var allTests = [
        ("testGlobalCombinationImplicitLength", testGlobalCombinationImplicitLength),
        ("testGlobalCombinationArgLengthLessThanCollectionLength", testGlobalCombinationArgLengthLessThanCollectionLength),
        ("testGlobalCombinationArgLengthGreaterThanCollectionLength", testGlobalCombinationArgLengthGreaterThanCollectionLength),
    ]
}
    
