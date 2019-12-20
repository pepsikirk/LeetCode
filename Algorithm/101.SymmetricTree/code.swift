
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

func isSymmetric(_ root: TreeNode?) -> Bool {
    return dfs(root, root)
}

func dfs(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    guard let tn1 = p, let tn2 = q else {
        if p == nil && q == nil {
            return true
        } else {
            return false
        }
    }
    if tn1.val != tn2.val {
        return false
    }
    return dfs(tn1.left, tn2.right) && dfs(tn1.right, tn2.left)
}

let node1 = TreeNode(1)
let node2 = TreeNode(2)
let node3 = TreeNode(3)
node1.left = node2
node1.right = node3

let res = isSymmetric(node1)
print(res)

