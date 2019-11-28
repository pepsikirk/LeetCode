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

首先想到的是可以使用2个循环遍历数组去暴力取的所有和找到最大值。但是这样实际复杂度是 O(n²)。这道题的现在的代码很简单，时间复杂度是 O(n) ，但是理解起来会有点绕。 sum 为记录的和，res 为记录的最大和，`res = max(res, sum)`比较容易理解，就是已经得到的和与结果去最大值。`sum = max(sum + num, num)`难理解一点，为什么这样就可以取到和了，是因为当`sum + num < num`即 `sum < 0` 时，实际上之前的和已经小于0了，再加也不可能得到最大值，所以这时候的就需要重置 sum = num 重新开始相加。这样就可以得到最大的和了。

    func maxSubArray(_ nums: [Int]) -> Int {
        var res = Int.min
        var sum = 0
        for num in nums {
            sum = max(sum + num, num)
            res = max(res, sum)
        }
        return res
    }
提交后成功。用时 52 ms ，战胜了 74.47 % 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/53.MaximumSubarray/code.swift)




