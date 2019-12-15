# 题目

## [100. 相同的树](https://leetcode-cn.com/problems/same-tree/)

给定两个二叉树，编写一个函数来检验它们是否相同。

如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。

**示例 1:**

    输入:       1         1
              / \       / \
             2   3     2   3
    
            [1,2,3],   [1,2,3]

**示例 2:**

    输入:      1          1
              /           \
             2             2
    
            [1,2],     [1,null,2]
    
    输出: false

**示例 3:**

    输入:       1         1
              / \       / \
             2   1     1   2
    
            [1,2,1],   [1,1,2]
    
    输出: false

# 思路

可以使用深度优先搜索，先判断 p 和 q 是否为空，同时都为空返回 true，都不为空继续出去，其它情况就是有一个为空，返回 false 。都不为空判断值，只要不等就为 false，相等就继续分别递归左边和右边。

下面是代码：

```
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
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
        return isSameTree(tn1.left, tn2.left) && isSameTree(tn1.right, tn2.right)
    }
}
```

提交后通过，耗时 8 ms ，战胜了 88.89 % 的 Swift 提交记录。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/100.SameTree/code.swift)




