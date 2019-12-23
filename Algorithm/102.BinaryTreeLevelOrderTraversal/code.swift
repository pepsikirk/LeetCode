
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

var result = [[Int]]()

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    dfs(tr: root, depth: 0)
    return result
}

func dfs(tr: TreeNode?, depth: Int) {
    guard let tr = tr else {
        return
    }
    
    if result.count == depth {
        result.append([Int]())
    }
    result[depth].append(tr.val)
    
    dfs(tr: tr.left, depth: depth + 1)
    dfs(tr: tr.right, depth: depth + 1)
}

let node1 = TreeNode(10)
let node2 = TreeNode(5)
let node3 = TreeNode(15)
let node4 = TreeNode(6)
let node5 = TreeNode(20)
node1.left = node2
node1.right = node3
node3.left = node4
node3.right = node5

let res = levelOrder(node1)
print(res)

