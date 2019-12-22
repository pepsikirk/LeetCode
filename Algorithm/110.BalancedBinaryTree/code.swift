
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

func isBalanced(_ root: TreeNode?) -> Bool {
    return dfs(tr: root, depth: 0) != Int.min
}

func dfs(tr: TreeNode?, depth: Int) -> Int {
    guard let tr = tr else {
        return depth
    }
    let leftDepth = dfs(tr: tr.left, depth: depth + 1)
    if leftDepth < 0 {
        return Int.min
    }
    let rightDepth = dfs(tr: tr.right, depth: depth + 1)
    if rightDepth < 0 {
        return Int.min
    }
    if abs(leftDepth - rightDepth) > 1 {
        return Int.min
    }
    return max(leftDepth, rightDepth)
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

let res = isBalanced(node1)
print(res)

