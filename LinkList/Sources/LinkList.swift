
class LinkNode<T: CustomStringConvertible> {
    
    let value: T
    var next: LinkNode?
    
    init(value: T) {
        self.value = value
    }
}

extension LinkNode {
    func append(node: LinkNode) {
        next = node
    }
}

extension LinkNode: CustomStringConvertible {
    var description: String {
        var result = value.description
        var currentNode = self
        while currentNode.next != nil {
            if let next = currentNode.next {
                result.append(next.description)
                currentNode = next
            }
        }
        return result
    }
}

