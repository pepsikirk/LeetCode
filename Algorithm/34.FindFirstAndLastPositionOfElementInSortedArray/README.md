# 题目

## [34. 在排序数组中查找元素的第一个和最后一个位置](https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/)

给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

你的算法时间复杂度必须是 O(log n) 级别。

如果数组中不存在目标值，返回 [-1, -1]。

示例 1:

```
输入: nums = [5,7,7,8,8,10], target = 8
输出: [3,4]
```


示例 2:

```
输入: nums = [5,7,7,8,8,10], target = 6
输出: [-1,-1]
```

# 思路

这道题要求时间复杂度为 O(log n) ，那么基本就必须用二分法。但是会用重复元素，于是想到可以先二分查找，找到以后再遍历2边元素，相同的就继续，直到找到不同。最后就得到了范围。

不过中间还需要处理很多异常情况，比如数组为空等。所以二分法虽然容易理解，但是写起来还是比较容易出错的。

最后代码如下：

    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count == 0 {
            return [-1, -1]
        }
        var left = 0
        var right = nums.count - 1
        var index: Int? = nil
        while left + 1 < right {
            let mid = left + (right - left)/2
            let midNum = nums[mid]
            
            if midNum == target {
                index = mid
                break
            } else if target < midNum {
                right = mid
            } else {
                left = mid
            }
        }
        
        if index == nil {
            if nums[left] == target {
                index = left
            } else if nums[right] == target {
                index = right
            } else {
                return [-1,-1]
            }
        }
        
        var start = index!
        var end = index!
        while start >= 0 && nums[start] == target {
            start -= 1
        }
        start += 1
        while end < nums.count && nums[end] == target {
            end += 1
        }
        end -= 1
        return [start, end]
    }
    
提交后成功。用时 68 ms ，战胜了 67.86 % 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/34.FindFirstAndLastPositionOfElementInSortedArray/code.swift)




