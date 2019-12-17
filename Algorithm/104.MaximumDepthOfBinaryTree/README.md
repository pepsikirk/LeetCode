# 题目

## [104. 二叉树的最大深度](https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/)

给定一个二叉树，找出其最大深度。

二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

说明: 叶子节点是指没有子节点的节点。

示例：
给定二叉树 `[3,9,20,null,null,15,7]`

        3
       / \
      9  20
        /  \
       15   7

返回它的最大深度 3 。

# 思路

这道题使用深度优先算法，使用一个参数记录当前深度，递归时深度加一，取左右最大值返回。

下面是代码：

```
func maxDepth(_ root: TreeNode?) -> Int {
    return dfs(tr: root, depth: 0)
}

func dfs(tr: TreeNode?, depth: Int) -> Int {
    if tr == nil {
        return depth
    }
    return max(dfs(tr: tr?.left, depth: depth + 1), dfs(tr: tr?.right, depth: depth + 1))
}
```

提交后通过，耗时 32 ms ，战胜了95.81 % 的 Swift 提交记录。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/104.MaximumDepthOfBinaryTree/code.swift)




