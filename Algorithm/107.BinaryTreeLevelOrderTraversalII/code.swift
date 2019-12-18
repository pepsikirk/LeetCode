
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

func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
    dfs(tr: root, depth: 0)
    return result.reversed()
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

let node1 = TreeNode(1)
let node2 = TreeNode(2)
let node3 = TreeNode(3)
node1.left = node2
node2.left = node3

let res = levelOrderBottom(node1)
print(res)

