# 题目

## [215. 数组中的第K个最大元素](https://leetcode-cn.com/problems/kth-largest-element-in-an-array/)

在未排序的数组中找到第 **k** 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。

**示例 1:**

```
输入: [3,2,1,5,6,4] 和 k = 2
输出: 5
```

**示例 2:**

```
输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
输出: 4
```

**说明:**

你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。

# 思路

看到这道题马上想到的方法就是直接使用系统排序方法，然后再取第k个最大元素就好了。

代码如下:

```
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var nums = nums.sorted()
    return nums[nums.count - k]
}
```

当然结果是通过的，用时 60 ms，战胜 75.25% Swift 提交。但是明显也题意也不希望我们用这个方法，如果用这个方法面试估计得不到什么好结果。

那么比较好的办法是使用快速选择算法。快速选择与快速排序一脉相承，都是每次对一个元素进行大小判断后，大的在左边，小的在右边，正好也能得到这个元素在整个数组排序后的位置，只需要根据这个位置去得到数组变换区间，就可以不断缩小范围，直到得到目标位置。

下面就是代码：

```
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    let targetIndex = nums.count - k
    var left = 0
    var right = nums.count - 1
    var nums = nums
    var res: Int? = nil
    while res == nil {
        let index = partition(nums: &nums, left: left, right: right)
        if index < targetIndex {
            left = index + 1
        } else if index > targetIndex {
            right = index - 1
        } else {
            res = nums[index]
        }
    }
    return res!
}

func partition(nums: inout [Int], left: Int, right: Int) -> Int {
    if left == right {
        return left
    }
    let randomIndex = Int.random(in: left...right)
    swap(nums: &nums, index1: left, index2: randomIndex)
    let pivot = nums[left]
    var j = left
    for i in left+1...right {
        if nums[i] < pivot {
            j += 1
            swap(nums: &nums, index1: i, index2: j)
        }
    }
    swap(nums: &nums, index1: left, index2: j)
    return j
}

func swap(nums: inout [Int], index1: Int, index2: Int) {
    let temp = nums[index1]
    nums[index1] = nums[index2]
    nums[index2] = temp
}
```

提交后耗时 60 ms ，战胜了 99.01% 的 Swift 提交。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/215.KthLargestElementInAnArray/code.swift)




