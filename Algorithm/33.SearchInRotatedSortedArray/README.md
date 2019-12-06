# 题目

## [33. 搜索旋转排序数组](https://leetcode-cn.com/problems/search-in-rotated-sorted-array/)

假设按照升序排序的数组在预先未知的某个点上进行了旋转。

( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。

搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。

你可以假设数组中不存在重复的元素。

你的算法时间复杂度必须是 O(log n) 级别。

示例 1:

```
输入: nums = [4,5,6,7,0,1,2], target = 0
输出: 4
```


示例 2:

```
输入: nums = [4,5,6,7,0,1,2], target = 3
输出: -1
```



# 思路

这道题要求时间复杂度为 O(log n) ，那么基本就必须用二分法。但是这个数组不是排序数组，那么如何二分呢？

首先，二分循环中，取中间数的代码是不用变的。关键就是二分的条件。

在题目中，虽然不是完全排序数组，而是旋转过的排序数组，那么就是实际上有2个排序数组在这个数组里面。那么我们就可以先判断当 midNum <= leftNum 时，代表目前中间数的左边肯定都还是排序数组，如果 target 在这个排序数组中，就直接在左边找，如果不在，就在右边找。以此类推，当 midNum <= leftNum 不成立时，我们也只需要判断 target 在右边就在右边二分即可。

最后代码如下：

    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2;
            let midNum = nums[mid]
            if midNum == target {
                return mid
            }
            
            let leftNum = nums[left]
            if leftNum <= midNum {
                if target < midNum && target >= leftNum {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                let rightNum = nums[right]
                if (target <= rightNum && target > midNum) {
                    left = mid + 1;
                } else {
                    right = mid - 1;
                }
            }
        }
        
        return -1
    }
提交后成功。用时 24 ms ，战胜了 79.41 % 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/35.SearchInsertPosition/code.swift)




