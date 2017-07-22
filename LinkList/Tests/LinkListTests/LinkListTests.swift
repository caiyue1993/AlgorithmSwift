import XCTest
@testable import LinkList

class LinkListTests: XCTestCase {
    func testBlank() {
        let first = LinkNode(value: "A")
        XCTAssertEqual(first.description, "A")
    }
    
    func testTwo() {
        let first = LinkNode(value: "A")
        let b = LinkNode(value: "B")
        first.append(node: b)
        XCTAssertEqual(first.description, "AB")
    }
}
