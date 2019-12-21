# 题目

## [226. 翻转二叉树](https://leetcode-cn.com/problems/invert-binary-tree/)

翻转一棵二叉树。

示例：

输入：

         4
       /   \
      2     7
     / \   / \
    1   3 6   9
输出：

```
     4
   /   \
  7     2
 / \   / \
9   6 3   1
```

**备注:**
这个问题是受到 Max Howell 的 原问题 启发的 ：

> 谷歌：我们90％的工程师使用您编写的软件(Homebrew)，但是您却无法在面试时在白板上写出翻转二叉树这道题，这太糟糕了。
>

# 思路

这道题还是使用深度优先算法，先交换当前节点的左右，再分别递归左右即可。

下面是代码：

```
func invertTree(_ root: TreeNode?) -> TreeNode? {
    dfs(tr: root)
    return root
}

func dfs(tr: TreeNode?) {
    guard let tr = tr else {
        return
    }
    let temp = tr.left
    tr.left = tr.right
    tr.right = temp
    dfs(tr: tr.left)
    dfs(tr: tr.right)
}
```

提交后通过，耗时 8 ms ，战胜了 76.98 % 的 Swift 提交记录。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/226.InvertBinaryTree/code.swift)




