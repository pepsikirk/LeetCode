
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

var gInorder: [Int] = []
var gPostorder: [Int] = []
var inoderDict = [Int:Int]()

func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    gInorder = inorder
    gPostorder = postorder
    for (index, num) in inorder.enumerated() {
        inoderDict[num] = index
    }
    return create(0, inorder.count - 1, 0, postorder.count - 1)
}

func create(_ iStart: Int, _ iEnd: Int, _ pStart: Int, _ pEnd: Int) -> TreeNode? {
    guard iStart <= iEnd || pStart <= pEnd else {
        return nil
    }
    let value = gPostorder[pEnd]
    let tr = TreeNode(value)
    let index = inoderDict[value]!
    tr.left = create(iStart, index - 1, pStart, pStart + index - iStart - 1)
    tr.right = create(index + 1, iEnd, pStart + index - iStart, pEnd - 1)
    return tr;
}

let res = buildTree([9,3,15,20,7], [9,15,7,20,3])
print(res)

