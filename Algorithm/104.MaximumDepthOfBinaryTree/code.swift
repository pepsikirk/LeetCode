
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

func maxDepth(_ root: TreeNode?) -> Int {
    return dfs(tr: root, depth: 0)
}

func dfs(tr: TreeNode?, depth: Int) -> Int {
    if tr == nil {
        return depth
    }
    return max(dfs(tr: tr?.left, depth: depth + 1), dfs(tr: tr?.right, depth: depth + 1))
}

let node1 = TreeNode(1)
let node2 = TreeNode(2)
let node3 = TreeNode(3)
node1.left = node2
node2.left = node3

let res = maxDepth(node1)
print(res)

