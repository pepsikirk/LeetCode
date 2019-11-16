# 题目

## [11. 盛最多水的容器](https://leetcode-cn.com/problems/container-with-most-water/)

给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

说明：你不能倾斜容器，且 n 的值至少为 2。

![img](https://aliyun-lc-upload.oss-cn-hangzhou.aliyuncs.com/aliyun-lc-upload/uploads/2018/07/25/question_11.jpg)

图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。

 

示例:

```
输入: [1,8,6,2,5,4,8,3,7]
输出: 49
```

# 思路

这道题说得容纳最多水实际上就是求面积，上面的图表示的很清楚了。首先想到的就是使用暴力法，思路很简单，对比所有数与其它数的面积，但是时间复杂度是 O(n²) 完全超出时间限制。

要做到时间复杂度是 O(n) 需要使用的是双指针法。方法是 left 为 0 ，right 为 n - 1，每次比较值，计算面积，取最大面积，然后小的值向内移动。

为什么这个方法可以得到最大的面积呢，也比较好理解。首先根据 2 个指针 left = 1 和 right = n - 1 时，取到面积，两个指针较小的值为 min，这时候看似只得到了一个面积，实际上也排除了所有其它数与 min 的面积，因为他们的高一定小于等于 min，而长一定比当前的长小，所以排除了 n - 1 个情况。以此类推，只要把最小值向内移动，就可以排除所有情况，可以得到最大的面积了。

下面是代码：

```
func maxArea(_ height: [Int]) -> Int {
    var res = 0
    var left = 0
    var right = height.count - 1
    while left != right {
        let leftValue = height[left]
        let rightValue = height[right]
        let length = right - left
        let min: Int
        if leftValue > rightValue {
            right -= 1
            min = rightValue
        } else {
            left += 1
            min = leftValue
        }
        res = max(res, min * length)
    }
    return res
}
```

提交后耗时 124 ms ，战胜了98.02% 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/11.ContainerWithMostWater/code.swift)




