
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

var gPreorder: [Int] = []
var gInorder: [Int] = []
var inoderDict = [Int:Int]()

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    gPreorder = preorder
    gInorder = inorder
    for (index, num) in inorder.enumerated() {
        inoderDict[num] = index
    }
    return create(0, preorder.count - 1, 0, inorder.count - 1)
}

func create(_ pStart: Int, _ pEnd: Int, _ iStart: Int, _ iEnd: Int) -> TreeNode? {
    guard pStart <= pEnd || iStart <= iEnd else {
        return nil
    }
    let value = gPreorder[pStart]
    let tr = TreeNode(value)
    let index = inoderDict[value]!
    tr.left = create(pStart + 1, pStart + index - iStart, iStart, index - 1)
    tr.right = create(pStart + index - iStart + 1, pEnd, index + 1, iEnd)
    return tr;
}

let res = buildTree([3,9,20,15,7],[9,3,15,20,7])
print(res)

let res2 = buildTree([1,2],[1,2])
print(res2)

