
import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    var result = [Int]()
    var array = [root]
    while array.count != 0 {
        let cur = array.last!
        if cur!.left == nil {
            result.append(cur!.val)
            array.removeLast()
            if let right = cur!.right {
                array.append(right)
                cur?.right = nil
            }
        } else if let left = cur!.left {
            array.append(left)
            cur?.left = nil
        }
    }
    return result
}

let node1 = TreeNode(1)
let node2 = TreeNode(2)
let node3 = TreeNode(3)
node1.right = node2
node2.left = node3

let res = inorderTraversal(node1)
print(res)

