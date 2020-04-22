import XCTest
@testable import Backtrace

final class BacktraceTests: XCTestCase {
    func testPermute() {
        let nums = [1,2,3]
        let expectedResults = [[1,3,2], [1,2,3],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
        XCTAssertEqual(Set(Backtrace().permute(nums)), Set(expectedResults))
    }

    func testPermuteUnique() {
        let nums = [1, 1, 1, 2]
        let expectedResults = [[1, 1, 1, 2], [1, 1, 2, 1], [1, 2, 1, 1], [2, 1, 1, 1]]
        XCTAssertEqual(Set(Backtrace().permuteUnique(nums)), Set(expectedResults))
    }
    
    static var allTests = [
        ("testPermute", testPermute),
        ("testPermuteUnique", testPermuteUnique)
    ]
}
