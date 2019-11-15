# 题目

## [69. x 的平方根](https://leetcode-cn.com/problems/sqrtx/)

实现 `int sqrt(int x)` 函数。

计算并返回 x 的平方根，其中 x 是非负整数。

由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。

示例 1:

```
输入: 4
输出: 2
```


示例 2:

```
输入: 8
输出: 2
说明: 8 的平方根是 2.82842..., 
     由于返回类型是整数，小数部分将被舍去。
```



# 思路

我马上试了下直接使用系统的平方根函数 LOL。

```
func mySqrt(_ x: Int) -> Int {
    return Int(sqrt(Double(x)))
}
```

通过了，但是耗时战胜了 61.23% 的代码， 并不太快，我猜应该是因为系统方法是算到了小数，所以并不会那么快。

下面讲下我自己做这道题的思路。

首先想到是暴力法一个一个去试，但是提交后直接超出时间限制，很明显，这道题暴力法是完全行不通的。

于是想到可以使用二分法，这样可以快很多，left 从 1 开始，right 从 x 开始，每次判断中间值大小然后给 left 或 right 赋值 为 mid 。

下面是代码：

    func mySqrt(_ x: Int) -> Int {
        if x == 0 {
            return 0
        }
        var left = 1
        var right = x
        while right - left > 1 {
            let mid = (left + right)/2
            if mid * mid > x {
                right = mid
            } else {
                left = mid
            }
        }
        return left
    }
提交后成功。用时 4 ms ，战胜了 99.02 % 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/69.Sqrt(x)/code.swift)




