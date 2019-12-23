# 题目

## [102. 二叉树的层次遍历](https://leetcode-cn.com/problems/binary-tree-level-order-traversal/)

给定一个二叉树，返回其按层次遍历的节点值。 （即逐层地，从左到右访问所有节点）。

例如:
给定二叉树: `[3,9,20,null,null,15,7]`,

        3
       / \
      9  20
        /  \
       15   7

返回其自底向上的层次遍历为：

```
[
  [3],
  [9,20],
  [15,7]
]
```

# 思路

这道题和107题几乎一样，只是少了需要将数组反转的操作。

下面是代码：

```
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

```

提交后通过，耗时 16 ms ，战胜了97.9 % 的 Swift 提交记录。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/102.BinaryTreeLevelOrderTraversal/code.swift)




