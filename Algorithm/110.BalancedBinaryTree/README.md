# 题目

## [110. 平衡二叉树](https://leetcode-cn.com/problems/balanced-binary-tree/)

给定一个二叉树，判断它是否是高度平衡的二叉树。

本题中，一棵高度平衡二叉树定义为：

> 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过1。
>

**示例 1:**

给定二叉树 `[3,9,20,null,null,15,7]`

        3
       / \
      9  20
        /  \
       15   7

返回 `true` 。

**示例 2:**

给定二叉树 `[1,2,2,3,3,null,null,4,4]`

```
       1
      / \
     2   2
    / \
   3   3
  / \
 4   4
```

返回 `false` 。

# 思路

这道题还是使用深度优先算法，使用一个参数记录当前深度，递归时深度加一，每次递归取左右节点的深度的最大值返回，当左右节点返回的深度差的绝对值大于1时，就代表结果为 false ，这里就返回 Int.min ，最后就判断递归结果是否大于等于0，就是最终结果。

下面是代码：

```
func isBalanced(_ root: TreeNode?) -> Bool {
    return dfs(tr: root, depth: 0) >= 0
}

func dfs(tr: TreeNode?, depth: Int) -> Int {
    guard let tr = tr else {
        return depth
    }
    let leftDepth = dfs(tr: tr.left, depth: depth + 1)
    if leftDepth < 0 {
        return Int.min
    }
    let rightDepth = dfs(tr: tr.right, depth: depth + 1)
    if rightDepth < 0 {
        return Int.min
    }
    if abs(leftDepth - rightDepth) > 1 {
        return Int.min
    }
    return max(leftDepth, rightDepth)
}
```

提交后通过，耗时 48 ms ，战胜了 100 % 的 Swift 提交记录。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/110.BalancedBinaryTree/code.swift)




