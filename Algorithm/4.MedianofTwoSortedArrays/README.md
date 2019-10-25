# 题目

## [4. 寻找两个有序数组的中位数](https://leetcode-cn.com/problems/median-of-two-sorted-arrays/)

给定两个大小为 m 和 n 的有序数组 nums1 和 nums2。

请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。

你可以假设 nums1 和 nums2 不会同时为空。

示例 1:

```
nums1 = [1, 3]
nums2 = [2]

则中位数是 2.0
```

示例 2:

```
nums1 = [1, 2]
nums2 = [3, 4]

则中位数是 (2 + 3)/2 = 2.5
```

# 思路

首先想到，既然是两个数组寻找中位数，那么就可以直接把2个数组合并，然后对数组进行排序，再根据数组的数量取中间的1个或者2个数的平均数，就可以得到中位数了。

代码:

```
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let nums = (nums1 + nums2).sorted()
    if nums.count == 1 {
        return Double(nums.first!)
    }
    let count = nums.count%2
    let mid = nums.count/2
    if count == 0 {
        return Double((nums[mid] + nums[mid-1]))/2
    } else {
        return Double(nums[mid])
    }
}
```

这个代码提交后的数据为：耗时 116 ms ，战胜了 85.23% 的 Swift 代码。

虽然这个数据还不错，但是这个方法明显依赖于 Swift 的排序算法的时间复杂度，而题意要求算法的时间复杂度为 O(log(m + n))。那么就再看看要怎么做。

那么就想如何不合并数组也能取到中位数，只要每次遍历数组的第一个数，将最小的数删掉继续遍历，最后遍历中位数的次数，就可以得到中位数了。

代码如下：

```
    let nums = nums1 + nums2
    if nums.count == 1 {
        return Double(nums.first!)
    }
    var nums1 = nums1
    var nums2 = nums2
    
    var mid = nums.count/2
    var array = [Int]()
    while mid >= 0 {
        if nums1.count == 0 {
            array.append(nums2[0])
            nums2.remove(at: 0)
        } else if (nums2.count == 0 ) {
            array.append(nums1[0])
            nums1.remove(at: 0)
        } else {
            let num1 = nums1[0]
            let num2 = nums2[0]
            if num1 < num2 {
                array.append(nums1[0])
                nums1.remove(at: 0)
            } else {
                array.append(nums2[0])
                nums2.remove(at: 0)
            }
        }
        mid -= 1
    }
    if nums.count%2 == 0 {
        return Double(array.last! + array[array.count - 2])/2
    } else {
        return Double(array.last!)
    }
```

这个代码提交后的数据为：耗时 112 ms ，战胜了 87.25% 的 Swift 代码。

这个方法的时间复杂度是 m+n/2 ，实际就是 O(m+n) ，还是达不到 O(log(m + n)) ，再看看还能如何修改。

后续再对进行优化

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/4.MedianofTwoSortedArrays/MedianofTwoSortedArrays.swift)




