# 题目

## [95. 不同的二叉搜索树 II](https://leetcode-cn.com/problems/unique-binary-search-trees-ii/)

给定一个整数 *n*，生成所有由 1 ... *n* 为节点所组成的**二叉搜索树**。

**示例:**

    输入: 3
    输出:
    [
      [1,null,3,2],
      [3,2,null,1],
      [3,1,null,null,2],
      [2,1,3],
      [1,null,2,null,3]
    ]
    解释:
    以上的输出对应以下 5 种不同结构的二叉搜索树：
    
       1         3     3      2      1
        \       /     /      / \      \
         3     2     1      1   3      2
        /     /       \                 \
       2     1         2                 3

# 思路

这道题的难度在于构建的是二叉搜索树，二叉搜索树要求的就是左边必须大于右边，所以假设当前节点为 i ，那么左子树的节点就为 1…i-1，右子树的节点为 i+1…n 。所以，由此递归左右节点，然后在遍历左右节点返回的数组创建即可。还有一个地方是要注意 start > end 时，要返回一个 nil 的数组，这样才能正常的创建一个空节点。

下面是代码：

```
func generateTrees(_ n: Int) -> [TreeNode?] {
    if n == 0 {
        return [];
    }
    return create(1, n)
}

func create(_ start: Int, _ end: Int) -> [TreeNode?] {
    var array: [TreeNode?] = []
    if start > end {
        array.append(nil)
        return array
    }
    for i in start...end {
        let left = create(start, i - 1)
        let right = create(i + 1, end)
        
        for leftTN in left {
            for rightTN in right {
                let tn = TreeNode(i)
                tn.left = leftTN
                tn.right = rightTN
                array.append(tn)
            }
        }
    }
    return array
}
```

提交后通过，耗时 40 ms ，战胜了 66.67 % 的 Swift 提交记录。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/95.UniqueBinarySearchTreesII/code.swift)




