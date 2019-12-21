
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

func invertTree(_ root: TreeNode?) -> TreeNode? {
    dfs(tr: root)
    return root
}

func dfs(tr: TreeNode?) {
    guard let tr = tr else {
        return
    }
    let temp = tr.left
    tr.left = tr.right
    tr.right = temp
    dfs(tr: tr.left)
    dfs(tr: tr.right)
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

let res = invertTree(node1)
print(res)

