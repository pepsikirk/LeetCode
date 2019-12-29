
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

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    var k = k
    return dfs(root, &k)!
}

func dfs(_ tn: TreeNode?, _ k: inout Int) -> Int? {
    guard let tn = tn else {
        return nil
    }
    if let res = dfs(tn.left, &k) {
        return res
    }
    k -= 1
    if k == 0 {
        return tn.val
    }
    if let res = dfs(tn.right, &k) {
        return res
    }
    return nil
}

let tn1 = TreeNode(1)
let tn2 = TreeNode(2)
let tn3 = TreeNode(3)

tn2.left = tn1
tn2.right = tn3

let result = kthSmallest(tn2, 2)
print(result)

