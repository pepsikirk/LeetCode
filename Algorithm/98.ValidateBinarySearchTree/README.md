# 题目

## [100. 相同的树](https://leetcode-cn.com/problems/same-tree/)

给定一个二叉树，判断其是否是一个有效的二叉搜索树。

假设一个二叉搜索树具有如下特征：

- 节点的左子树只包含小于当前节点的数。
- 节点的右子树只包含大于当前节点的数。
- 所有左子树和右子树自身必须也是二叉搜索树。

**示例 1:**

    输入:
        2
       / \
      1   3
    输出: true

**示例 2:**

    输入:
        5
       / \
      1   4
         / \
        3   6
    输出: false

# 思路

二叉搜索树的特征可以使用第94题的中序遍历来验证，因为中序遍历就是完全从左到中到右遍历，只需要判断遍历的前一个数大于等于了后一个数，就代表不是二叉搜索树。

下面是代码：

```
var pre = Int.min

func isValidBST(_ root: TreeNode?) -> Bool {
    return dfs(tr: root)
}

func dfs(tr: TreeNode?) -> Bool {
    guard let tr = tr else {
        return true
    }

    let result = dfs(tr: tr.left)
    if !result || pre >= tr.val  {
        return false
    }
    pre = tr.val
    return dfs(tr: tr.right)
}
```

提交后通过，耗时 52 ms ，战胜了 100 % 的 Swift 提交记录。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/98.ValidateBinarySearchTree/code.swift)




