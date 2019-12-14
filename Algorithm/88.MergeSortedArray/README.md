# 题目

## [88. 合并两个有序数组](https://leetcode-cn.com/problems/merge-sorted-array/)

给定两个有序整数数组 *nums1* 和 *nums2*，将 *nums2* 合并到 *nums1* 中*，*使得 *num1* 成为一个有序数组。

**说明:**

- 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
- 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。

**示例:**

```
输入:
nums1 = [1,2,3,0,0,0], m = 3
nums2 = [2,5,6],       n = 3

输出: [1,2,2,3,5,6]
```

# 思路

这道题看到的第一个想法就是，直接合并两个数组，然后排序不就好了。

下面是代码：

```
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        nums1 = Array(nums1[0..<m])
        nums1 += nums2
        nums1.sort()
    }
```

提交后通过，耗时 28 ms ，战胜了 5.52 % 的 Swift 提交记录。

明显速度比较慢，应该是因为排序导致的。那就自己进行插入，不是用系统排序试试看。

```
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    if m == 0 {
        nums1 = nums2
        return
    }
    nums1 = Array(nums1[0..<m])
    var index = 0
    let last = nums1.last
    for num in nums2 {
        if num > last! {
            nums1.append(num)
            continue
        }
        while index < nums1.count-1 && nums1[index] < num {
            index += 1
        }
        nums1.insert(num, at: index)
    }
}
```

提交后通过，耗时 12 ms ，战胜了 93.86 % 的 Swift 提交记录。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/88.MergeSortedArray/code.swift)




