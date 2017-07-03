//
//  CombinationTests.swift
//  SwiftCombination
//
//  Created by Keita Okamoto on 2017/07/01.
//
//
import XCTest
import SwiftCombination

final class ArrayPermutationTests: SwiftCombinationTests {}

extension ArrayPermutationTests {
    func testImplicitLength() {
        let actual = [0, 1].permutation()
        let expected = [
            [0, 1],
            [1, 0],
        ]
        XCTAssertEqual(actual.count, expected.count)
        zip(actual, expected).forEach { XCTAssertEqual($0, $1) }
    }

    func testExplicitLength() {
        let actual = [0, 1].permutation(2)
        let expected = [
            [0, 1],
            [1, 0],
        ]
        XCTAssertEqual(actual.count, expected.count)
        zip(actual, expected).forEach { XCTAssertEqual($0, $1) }
    }

    func testArgLengthLessThanCollectionLength() {
        let actual = [0, 1].permutation(1)
        let expected = [[0], [1]]
        XCTAssertEqual(actual.count, expected.count)
        zip(actual, expected).forEach { XCTAssertEqual($0, $1) }
    }

    func testArgLengthGreaterThanCollectionLength() {
        let actual = [0, 1].permutation(3)
        XCTAssertTrue(actual.isEmpty)
    }

    func testImplicitLengthWithClosure() {
        let expected = [
            [0, 1],
            [1, 0],
        ]
        var i = 0
        [0, 1].permutation{ actual in
            XCTAssertEqual(actual, expected[i])
            i = i + 1
        }
        XCTAssertNotEqual(i, 0)
    }

    func testExplicitLengthWithClosure() {
        let expected = [
            [0, 1],
            [1, 0],
        ]
        var i = 0
        [0, 1].permutation(2) { actual in
            XCTAssertEqual(actual, expected[i])
            i = i + 1
        }
        XCTAssertNotEqual(i, 0)
    }

    func testArgLengthLessThanCollectionLengthWithClosure() {
        let expected = [[0], [1]]
        var i = 0
        [0, 1].permutation(1) { actual in
            XCTAssertEqual(actual, expected[i])
            i = i + 1
        }
        XCTAssertNotEqual(i, 0)
    }

    func testArgLengthGreaterThanCollectionLengthWithClosure() {
        var i = 0
        [0, 1].permutation(3) { _ in i = i + 1 }
        XCTAssertEqual(i, 0)
    }

    static var allTests = [
        ("testImplicitLength", testImplicitLength),
        ("testExplicitLength", testExplicitLength),
        ("testArgLengthLessThanCollectionLength", testArgLengthLessThanCollectionLength),
        ("testArgLengthGreaterThanCollectionLength", testArgLengthGreaterThanCollectionLength),
        ("testImplicitLengthWithClosure", testImplicitLengthWithClosure),
        ("testExplicitLengthWithClosure", testExplicitLengthWithClosure),
        ("testArgLengthLessThanCollectionLengthWithClosure", testArgLengthLessThanCollectionLengthWithClosure),
        ("testArgLengthGreaterThanCollectionLengthWithClosure", testArgLengthGreaterThanCollectionLengthWithClosure),
    ]
}
