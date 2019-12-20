# 题目

## [101. 对称二叉树](https://leetcode-cn.com/problems/symmetric-tree/)

给定一个二叉树，检查它是否是镜像对称的。

例如，二叉树 `[1,2,2,3,4,4,3]` 是对称的。

        1
       / \
      2   2
     / \ / \
    3  4 4  3

但是下面这个 `[1,2,2,null,3,null,3]` 则不是镜像对称的:

        1
       / \
      2   2
       \   \
       3    3

# 思路

这道题跟第100题类似，只需要将左左右右对比，改为左右对比即可。

下面是代码：

```
func isSymmetric(_ root: TreeNode?) -> Bool {
    return dfs(root, root)
}

func dfs(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    guard let tn1 = p, let tn2 = q else {
        if p == nil && q == nil {
            return true
        } else {
            return false
        }
    }
    if tn1.val != tn2.val {
        return false
    }
    return dfs(tn1.left, tn2.right) && dfs(tn1.right, tn2.left)
}
```

提交后通过，耗时 16 ms ，战胜了95.89 % 的 Swift 提交记录。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/101.SymmetricTree/code.swift)




