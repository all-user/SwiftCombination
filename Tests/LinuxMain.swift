import XCTest
@testable import SwiftCombinationTests

XCTMain([
  testCase(ArrayCombinationTests.allTests),
  testCase(ArrayPermutationTests.allTests),
  testCase(ArrayRepeatedCombinationTests.allTests),
  testCase(ArrayRepeatedPermutationTests.allTests),
  testCase(GlobalCombinationTests.allTests),
  testCase(GlobalPermutationTests.allTests),
  testCase(GlobalRepeatedCombinationTests.allTests),
  testCase(GlobalRepeatedPermutationTests.allTests),
])
