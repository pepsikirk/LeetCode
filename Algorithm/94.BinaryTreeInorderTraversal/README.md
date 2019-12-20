# 题目

## [94. 二叉树的中序遍历](https://leetcode-cn.com/problems/binary-tree-inorder-traversal/)

给定一个二叉树，返回它的*中序* 遍历。

**示例:**

    输入: [1,null,2,3]
       1
        \
         2
        /
       3
    
    输出: [1,3,2]

**进阶:** 递归算法很简单，你可以通过迭代算法完成吗？

# 思路

首先要知道中序遍历是什么，中序遍历首先遍历左子树，然后访问根结点，最后遍历右子树。可以使用深度优先搜索，直接先递归左，再将当前值加入数组，再递归右即可。

下面是代码：

```
var result = [Int]()

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    dfs(tr: root)
    return result
}

func dfs(tr: TreeNode?) {
    guard let tr = tr else {
        return
    }

    dfs(tr: tr.left)
    result.append(tr.val)
    dfs(tr: tr.right)
}
```

提交后通过，耗时 0 ms ，战胜了 100 % 的 Swift 提交记录。

进阶要求是使用迭代算法，那么我们试一试。

由于需要中序遍历，所以需要一个数组来记录当前不能处理的元素，当存在左节点时将左节点加入数组，不存在时就将当前值存入结果数组，如果存在又节点将右节点加入数组。最后每次处理数组最后一个元素，直到数组为空即可。

```
func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    var result = [Int]()
    var array = [root]
    while array.count != 0 {
        let cur = array.last!
        if let left = cur!.left {
            array.append(left)
            cur?.left = nil
        } else {
            result.append(cur!.val)
            array.removeLast()
            if let right = cur!.right {
                array.append(right)
                cur?.right = nil
            }
        }
    }
    return result
}
```

提交后通过，耗时 4 ms ，战胜了 97.70 % 的 Swift 提交记录。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/94.BinaryTreeInorderTraversal/code.swift)




