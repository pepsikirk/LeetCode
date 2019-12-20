
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

var pre = Int.min

func isValidBST(_ root: TreeNode?) -> Bool {
    return dfs(tr: root)
}

func dfs(tr: TreeNode?) -> Bool {
    guard let tr = tr else {
        return true
    }
    
    let result = dfs(tr: tr.left)
    if !result || pre >= tr.val  {
        return false
    }
    pre = tr.val
    return dfs(tr: tr.right)
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

let res = isValidBST(node1)
print(res)

