
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

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
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
    
    if depth % 2 == 0 {
        result[depth].append(tr.val)
    } else {
        result[depth].insert(tr.val, at: 0)
    }
    dfs(tr: tr.left, depth: depth + 1)
    dfs(tr: tr.right, depth: depth + 1)
}

let node1 = TreeNode(1)
let node2 = TreeNode(2)
let node3 = TreeNode(3)
let node4 = TreeNode(4)
let node5 = TreeNode(5)
node1.left = node2
node1.right = node3
node2.left = node4
node3.right = node5

let res = zigzagLevelOrder(node1)
print(res)

