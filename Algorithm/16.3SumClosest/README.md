# 题目

## [16. 最接近的三数之和](https://leetcode-cn.com/problems/3sum-closest/)

给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。

```
例如，给定数组 nums = [-1，2，1，-4], 和 target = 1.

与 target 最接近的三个数的和为 2. (-1 + 2 + 1 = 2).
```

# 思路

先来最简单的暴力法，直接3个for循环看看

代码如下:

```
func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    var minValue = Int.max
    var returnSum = Int.max

    let nums = nums.sorted()
    for (index1, num1) in nums.enumerated() {
        var nums1 = nums
        nums1.remove(at: index1)
        for (index2, num2) in nums1.enumerated() {
            var nums2 = nums1
            nums2.remove(at: index2)
            for num3 in nums2 {
                let sum = num1 + num2 + num3
                let value = abs(sum - target)
                if value < minValue {
                    minValue = value
                    returnSum = sum
                }
            }
        }
    }
    return returnSum
}
```

运行结果果然直接超出时间限制，看来只要是稍微难点的题，用这种O(n³)的方法都是超时了解的。

看看要如何优化代码，要如何减少循环的次数呢？首先可以想到既然是数组，那么可以对它进行排序。数组排序后，可以从数组的头部和尾部同时取值遍历，根据取值后相加对比后的大小进行前后逼近，这样时间复杂度就可以降到O(n²)。

修改后的代码如下:

```
    var minDifference = Int.max
    var returnSum = Int.max
    //先对数组进行排序
    let nums = nums.sorted()
    for (index1, num1) in nums.enumerated() {
        //与之前的值相同就不处理，继续循环
        if index1 > 1 && num1 == nums[index1 - 1] {
            continue
        }
        var index2 = index1 + 1
        var index3 = nums.count - 1
        //排序后的数组可以根据值大小进行前后逼近，减少了循环次数
        while index2 < index3 {
            let num2 = nums[index2]
            let num3 = nums[index3]
            let sum = num1 + num2 + num3
            
            let difference = sum - target
            //比较三个数之和与目标值的差，等于0可以直接返回，大于0要将值变小，小于0将值变大
            if difference == 0 {
                return target
            } else if (difference > 0) {
                index3 -= 1
            } else {
                index2 += 1
            }
            let absDifference = abs(difference)
            if absDifference < minDifference {
                minDifference = absDifference
                returnSum = sum
            }
        }
    }
    return returnSum
```

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/16.3SumClosest/3SumClosest.swift)




