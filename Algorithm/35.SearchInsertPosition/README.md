# 题目

## [35. 搜索插入位置](https://leetcode-cn.com/problems/search-insert-position/)

给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

你可以假设数组中无重复元素。

示例 1:

```
输入: [1,3,5,6], 5
输出: 2
```


示例 2:

```
输入: [1,3,5,6], 2
输出: 1
```


示例 3:

```
输入: [1,3,5,6], 7
输出: 4
```


示例 4:

```
输入: [1,3,5,6], 0
输出: 0
```

# 思路

这道题很简单，直接遍历数组，判断大小即可

    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        for (i, num) in nums.enumerated() {
            if num < target {
                continue
            } else {
                return i
            }
        }
        return nums.count
    }
提交后成功。用时 44 ms ，战胜了 72.85 % 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/35.SearchInsertPosition/code.swift)




