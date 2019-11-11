# 题目

## [53. 最大子序和](https://leetcode-cn.com/problems/maximum-subarray/)

给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

示例:

```
输入: [-2,1,-3,4,-1,2,1,-5,4],
输出: 6
解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
```


进阶:

如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。

# 思路





    func maxSubArray(_ nums: [Int]) -> Int {
        var res = Int.min
        var sum = 0
        for num in nums {
            sum = max(sum + num, num)
            res = max(res, sum)
        }
        return res
    }
提交后成功。用时 52 s ，战胜了 74.47 % 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/53.MaximumSubarray/code.swift)




