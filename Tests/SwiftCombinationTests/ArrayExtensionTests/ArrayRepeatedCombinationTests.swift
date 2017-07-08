//
//  CombinationTests.swift
//  SwiftCombination
//
//  Created by Keita Okamoto on 2017/07/01.
//
//
import XCTest
import SwiftCombination

final class ArrayRepeatedCombinationTests: SwiftCombinationTests {}

extension ArrayRepeatedCombinationTests {
    func testExplicitLength() {
        let actual = [0, 1].repeatedCombination(2)
        let expected = [[0, 0], [0, 1], [1, 1]]
        XCTAssertEqual(actual.count, expected.count)
        zip(actual, expected).forEach { XCTAssertEqual($0, $1) }
    }

    func testArgLengthLessThanCollectionLength() {
        let actual = [0, 1].repeatedCombination(1)
        let expected = [[0], [1]]
        XCTAssertEqual(actual.count, expected.count)
        zip(actual, expected).forEach { XCTAssertEqual($0, $1) }
    }

    func testArgLengthGreaterThanCollectionLength() {
        let actual = [0, 1].repeatedCombination(3)
        let expected = [
            [0, 0, 0],
            [0, 0, 1],
            [0, 1, 1],
            [1, 1, 1],
        ]
        XCTAssertEqual(actual.count, expected.count)
        zip(actual, expected).forEach { XCTAssertEqual($0, $1) }
    }

    func testExplicitLengthWithClosure() {
        let expected = [[0, 0], [0, 1], [1, 1]]
        var i = 0
        [0, 1].repeatedCombination(2) { actual in
            XCTAssertEqual(actual, expected[i])
            i = i + 1
        }
        XCTAssertNotEqual(i, 0)
    }

    func testArgLengthLessThanCollectionLengthWithClosure() {
        let expected = [[0], [1]]
        var i = 0
        [0, 1].repeatedCombination(1) { actual in
            XCTAssertEqual(actual, expected[i])
            i = i + 1
        }
        XCTAssertNotEqual(i, 0)
    }

    func testArgLengthGreaterThanCollectionLengthWithClosure() {
        let expected = [
            [0, 0, 0],
            [0, 0, 1],
            [0, 1, 1],
            [1, 1, 1],
        ]
        var i = 0
        [0, 1].repeatedCombination(3) { actual in
            XCTAssertEqual(actual, expected[i])
            i = i + 1
        }
        XCTAssertNotEqual(i, 0)
    }

    static var allTests = [
        ("testExplicitLength", testExplicitLength),
        ("testArgLengthLessThanCollectionLength", testArgLengthLessThanCollectionLength),
        ("testArgLengthGreaterThanCollectionLength", testArgLengthGreaterThanCollectionLength),
        ("testExplicitLengthWithClosure", testExplicitLengthWithClosure),
        ("testArgLengthLessThanCollectionLengthWithClosure", testArgLengthLessThanCollectionLengthWithClosure),
        ("testArgLengthGreaterThanCollectionLengthWithClosure", testArgLengthGreaterThanCollectionLengthWithClosure),
    ]
}
