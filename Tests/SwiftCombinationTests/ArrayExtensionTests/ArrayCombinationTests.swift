//
//  CombinationTests.swift
//  SwiftCombination
//
//  Created by Keita Okamoto on 2017/07/01.
//
//
import XCTest
import SwiftCombination

final class ArrayCombinationTests: SwiftCombinationTests {}

extension ArrayCombinationTests {
    func testImplicitLength() {
        let actual = [0, 1, 2].combination()
        let expected = [[0, 1, 2]]
        XCTAssertEqual(actual.count, expected.count)
        zip(actual, expected).forEach { XCTAssertEqual($0, $1) }
    }

    func testExplicitLength() {
        let actual = [0, 1, 2].combination(3)
        let expected = [[0, 1, 2]]
        XCTAssertEqual(actual.count, expected.count)
        zip(actual, expected).forEach { XCTAssertEqual($0, $1) }
    }

    func testArgLengthLessThanCollectionLength() {
        let actual = [0, 1, 2].combination(2)
        let expected = [[0, 1], [0, 2], [1, 2]]
        XCTAssertEqual(actual.count, expected.count)
        zip(actual, expected).forEach { XCTAssertEqual($0, $1) }
    }

    func testArgLengthGreaterThanCollectionLength() {
        let actual = [0, 1, 2].combination(4)
        XCTAssertTrue(actual.isEmpty)
    }

    func testImplicitLengthWithClosure() {
        let expected = [[0, 1, 2]]
        var i = 0
        [0, 1, 2].combination{ actual in
            XCTAssertEqual(actual, expected[i])
            i = i + 1
        }
        XCTAssertNotEqual(i, 0)
    }

    func testExplicitLengthWithClosure() {
        let expected = [[0, 1, 2]]
        var i = 0
        [0, 1, 2].combination(3) { actual in
            XCTAssertEqual(actual, expected[i])
            i = i + 1
        }
        XCTAssertNotEqual(i, 0)
    }

    func testArgLengthLessThanCollectionLengthWithClosure() {
        let expected = [[0, 1], [0, 2], [1, 2]]
        var i = 0
        [0, 1, 2].combination(2) { actual in
            XCTAssertEqual(actual, expected[i])
            i = i + 1
        }
        XCTAssertNotEqual(i, 0)
    }

    func testArgLengthGreaterThanCollectionLengthWithClosure() {
        var i = 0
        [0, 1, 2].combination(4) { _ in i = i + 1 }
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
