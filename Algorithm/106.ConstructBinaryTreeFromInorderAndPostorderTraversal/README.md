# 题目

## [106. 从中序与后序遍历序列构造二叉树](https://leetcode-cn.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/)

根据一棵树的中序遍历与后序遍历构造二叉树。

**注意:**
你可以假设树中没有重复的元素。

例如，给出

    中序遍历 inorder = [9,3,15,20,7]
    后序遍历 postorder = [9,15,7,20,3]

返回如下的二叉树：

```
    3
   / \
  9  20
    /  \
   15   7
```

# 思路

这道题跟105题类似，中序遍历不变，前序遍历与后序遍历的区别在于。前序遍历的第一个元素一定是根节点，而后序遍历的根节点是最后一个元素。于是根据特性修改105题的代码。

下面是代码：

```
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
```

提交后通过，耗时 36 ms ，战胜了 95.24 % 的 Swift 提交记录。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/106.ConstructBinaryTreeFromInorderAndPostorderTraversal/code.swift)




