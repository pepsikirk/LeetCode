
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

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
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
    return isSameTree(tn1.left, tn2.left) && isSameTree(tn1.right, tn2.right)
}

let node1 = TreeNode(1)
let node2 = TreeNode(2)
let node3 = TreeNode(3)
node1.left = node2
node1.right = node3

let node11 = TreeNode(1)
let node12 = TreeNode(2)
let node21 = TreeNode(1)
let node22 = TreeNode(2)
node11.left = node12
node21.right = node22


let res = isSameTree(node11, node21)
print(res)

