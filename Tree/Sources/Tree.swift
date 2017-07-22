

class TreeNode<T: CustomStringConvertible> {
    let value: T
    var children: [TreeNode] = []
    weak var parent: TreeNode?
    
    init(value: T) {
        self.value = value
    }
}

extension TreeNode where T: Equatable {
    func add(child: TreeNode<T>) {
        children.append(child)
        child.parent = self
    }
    var depth: Int {
        var rootDepth = 0
        var currentNode = self
        while currentNode.parent != nil {
            rootDepth = rootDepth + 1
            if let parent = currentNode.parent {
                currentNode = parent
            }
        }
        return rootDepth
    }
}

// 注：广度优先遍历只有非递归方法
extension TreeNode: CustomStringConvertible {
    var description: String {
        var result = value.description
        if children.count > 0 {
            result.append("\n")
            for child in children {
                result.append(child.value.description)
            }
        }
        return result
    }
}
