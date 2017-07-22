import XCTest
@testable import Tree

class TreeTests: XCTestCase {
    func testOnlyRoot() {
        let root = TreeNode(value: "root")
        XCTAssertEqual(root.description, "root")
    }
    
    func testRootHasOneA() {
        let root = TreeNode(value: "root")
        let a = TreeNode(value: "A")
        root.add(child: a)
        XCTAssertEqual(root.description, "root\nA")
    }
    
    func testRootHasTwoChildren() {
        let root = TreeNode(value: "root")
        let a = TreeNode(value: "A")
        let b = TreeNode(value: "B")
        root.add(child: a)
        root.add(child: b)
        XCTAssertEqual(root.description, "root\nAB")
        XCTAssertEqual(a.depth, 1)
        XCTAssertEqual(root.depth, 0)
    }
}
