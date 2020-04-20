import XCTest
@testable import Backtrace

final class BacktraceTests: XCTestCase {
    func testExample() {
        let nums = [1,2,3]
        let expectedResults = [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
        XCTAssertEqual(Backtrace().permute(nums), expectedResults)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
