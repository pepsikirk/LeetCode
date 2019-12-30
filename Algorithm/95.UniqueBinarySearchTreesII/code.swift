
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

func generateTrees(_ n: Int) -> [TreeNode?] {
    if n == 0 {
        return [];
    }
    return create(1, n)
}

func create(_ start: Int, _ end: Int) -> [TreeNode?] {
    var array: [TreeNode?] = []
    if start > end {
        array.append(nil)
        return array
    }
    for i in start...end {
        let left = create(start, i - 1)
        let right = create(i + 1, end)
        
        for leftTN in left {
            for rightTN in right {
                let tn = TreeNode(i)
                tn.left = leftTN
                tn.right = rightTN
                array.append(tn)
            }
        }
    }
    return array
}

let res = generateTrees(3)
print(res)

