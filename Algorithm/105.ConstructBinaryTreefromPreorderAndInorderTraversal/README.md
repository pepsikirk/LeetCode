# 题目

## [105. 从前序与中序遍历序列构造二叉树](https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/)

根据一棵树的前序遍历与中序遍历构造二叉树。

**注意:**
你可以假设树中没有重复的元素。

例如，给出

    前序遍历 preorder = [3,9,20,15,7]
    中序遍历 inorder = [9,3,15,20,7]

返回如下的二叉树：

```
    3
   / \
  9  20
    /  \
   15   7
```

# 思路

这道题首先需要分析前序遍历和中序遍历的特性。前序遍历的第一个元素一定是根节点，而后序遍历的根节点的左边就是这个根节点的左子树，右边就是这个根节点的右子树。根据这个原理，我们可以对数组进行切分，就可以得到左右节点的前序遍历和中序遍历数组。再进行递归即可。

下面是代码：

```
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    if preorder.count == 0 {
        return nil
    }
    let value = preorder.first!
    let tr = TreeNode(value)
    let index = inorder.firstIndex(of: value)!
    let nextLeftPreorder = Array(preorder[1..<index+1])
    let nextLeftInorder = Array(inorder[0..<index])
    let nextRightPreorder = Array(preorder[index+1..<preorder.count])
    let nextRightInorder = Array(inorder[index+1..<inorder.count])
    tr.left = buildTree(nextLeftPreorder, nextLeftInorder)
    tr.right = buildTree(nextRightPreorder, nextRightInorder)
    return tr;
}
```

提交后通过，耗时 **3476** ms ，战胜了 14.58 % 的 Swift 提交记录。

很明显非常慢，我估计是因为数组切分创建新的数组导致的，那么我们就再优化一下，不对数组切分创建新数组再递归，而是操作同一个数组，只是对数组的 index 进行处理来递归试一下。

下面是代码：

```
var gPreorder: [Int] = []
var gInorder: [Int] = []

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    gPreorder = preorder
    gInorder = inorder
    return create(0, preorder.count - 1, 0, inorder.count - 1)
}

func create(_ pStart: Int, _ pEnd: Int, _ iStart: Int, _ iEnd: Int) -> TreeNode? {
    guard pStart <= pEnd || iStart <= iEnd else {
        return nil
    }
    let value = gPreorder[pStart]
    let tr = TreeNode(value)
    let index = gInorder.firstIndex(of: value)!
    tr.left = create(pStart + 1, pStart + index - iStart, iStart, index - 1)
    tr.right = create(pStart + index - iStart + 1, pEnd, index + 1, iEnd)
    return tr;
}
```

提交后通过，耗时 **476** ms ，战胜了 39.58 % 的 Swift 提交记录。

这一次优化，耗时少了一个数量级，但是还是偏慢，看来还是有优化空间。仔细看了下代码，应该是因为获取根节点在中序遍历中的 index 时，进行了查找消耗了时间。这一点可以优化，因为这个 index 是固定的，而我们需要调用多次，所以可以通过提前创建映射中序遍历 index 和 value 的字典，然后每次通过 value 来取 index 即可。当然这个前提是因为题目中说了 `你可以假设树中没有重复的元素。`不然是不能这么做的。

下面是代码：

```
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
```

提交后通过，耗时 28 ms ，战胜了 97.92 % 的 Swift 提交记录。耗时又降低了一个数量级。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/105.ConstructBinaryTreefromPreorderAndInorderTraversal/code.swift)




