# 题目

## [230. 二叉搜索树中第K小的元素](https://leetcode-cn.com/problems/kth-smallest-element-in-a-bst/)

给定一个二叉搜索树，编写一个函数 `kthSmallest` 来查找其中第 **k** 个最小的元素。

**说明：**
你可以假设 k 总是有效的，1 ≤ k ≤ 二叉搜索树元素个数。

**示例 1:**

```
输入: root = [3,1,4,null,2], k = 1
   3
  / \
 1   4
  \
   2
输出: 1
```

**示例 2:**

```
输入: root = [5,3,6,2,4,null,null,1], k = 3
       5
      / \
     3   6
    / \
   2   4
  /
 1
输出: 3
```

**进阶：**
如果二叉搜索树经常被修改（插入/删除操作）并且你需要频繁地查找第 k 小的值，你将如何优化 `kthSmallest` 函数？

# 思路

由于这个树是二叉搜索树，所以只需要中序遍历就能够按大小顺序遍历。这样我们只需要判断到了遍历的第k次，返回对应节点的值即可。

下面是代码：

```
func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    var k = k
    return dfs(root, &k)!
}

func dfs(_ tn: TreeNode?, _ k: inout Int) -> Int? {
    guard let tn = tn else {
        return nil
    }
    if let res = dfs(tn.left, &k) {
        return res
    }
    k -= 1
    if k == 0 {
        return tn.val
    }
    if let res = dfs(tn.right, &k) {
        return res
    }
    return nil
}
```

提交后通过，耗时 80 ms ，战胜了 100 % 的 Swift 提交记录。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/230.KthSmallestElementInABST/code.swift)




