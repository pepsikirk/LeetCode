# 题目

## [103. 二叉树的锯齿形层次遍历](https://leetcode-cn.com/problems/binary-tree-zigzag-level-order-traversal/)

给定一个二叉树，返回其节点值的锯齿形层次遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。

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
  [20,9],
  [15,7]
]
```

# 思路

这道题在102题的基础上进行修改，要求是在不同的层数顺序是不一样的，那么我们只需要在插入数组的时候对 depth 深度进行判断，当 depth % 2 等于0时，直接插入最后面，就是从左到右；否则，就将当前值插入最前面，这样就是从右到左。

下面是代码：

```
var result = [[Int]]()

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    dfs(tr: root, depth: 0)
    return result
}

func dfs(tr: TreeNode?, depth: Int) {
    guard let tr = tr else {
        return
    }
    
    if result.count == depth {
        result.append([Int]())
    }
    
    if depth % 2 == 0 {
        result[depth].append(tr.val)
    } else {
        result[depth].insert(tr.val, at: 0)
    }
    dfs(tr: tr.left, depth: depth + 1)
    dfs(tr: tr.right, depth: depth + 1)
}
```

提交后通过，耗时 16 ms ，战胜了 65.38% 的 Swift 提交记录。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/103.BinaryTreeZigzagLevelOrderTraversal/code.swift)




