# 题目

## [78. 子集](https://leetcode-cn.com/problems/subsets/)

给定一组**不含重复元素**的整数数组 *nums*，返回该数组所有可能的子集（幂集）。

**说明：**解集不能包含重复的子集。

**示例:**

```
输入: nums = [1,2,3]
输出:
[
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]
```

# 思路

这道题是一到回溯算法经典题型，那么我就不用别的方法，就用回溯算法 和 dfs 来做了。

想象集合中每个元素的选和不选，可以构成一个n层的二叉树，然后就如何构建这个二叉树的 dfs。

dfs 函数的参数为完整的数组 nums ，以及当前递归的深度等级 level 。需要一个全局变量 result 记录结果，一个全局变量 path 记录当前遍历的数组。

首先是结束条件就是我们设定的深度，当深度大于等于数组的数量时，就可以不再递归，将已经处理完成的数组添加到结果中。

然后是具体实现，二叉树的话，我们先不将当前等级的数加入 path ，开始递归，代表是不选。然后将当前的数加入 path，开始递归，代表是选了这个数。最后将当前加入的数 remove ，回复回溯状态。这样就完成了 dfs 函数。

下面是代码：

```
var result = [[Int]]()
var path = [Int]()

func subsets(_ nums: [Int]) -> [[Int]] {
    dfs(nums: nums, level: 0)
    return result
}

func dfs(nums: [Int], level: Int) {
    if (level >= nums.count) {
        result.append(path)
        return
    }

    dfs(nums: nums, level: level + 1)
    
    path.append(nums[level])
    dfs(nums: nums, level: level + 1)

    path.removeLast()
}
```

提交后通过，耗时 8 ms ，战胜了 100.00 % 的 Swift 提交记录

## 下面再用迭代法来做一下这道题：

遍历数组，将当前数字再创建数组插入结果数组，然后遍历第二次以后就再遍历结果数组，遍历到 r 为结果数组当前已经加入的数组，讲当前数字插入 r 再加入结果数组即可。

代码如下：

    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        for num in nums {
            for r in result {
                var r = r
                r.append(num)
                result.append(r)
            }
            result.append([num])
        }
        result.append([])
        return result
    }
提交后通过，耗时 8 ms ，战胜了 100.00 % 的 Swift 提交记录

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/78.Subsets/code.swift)




