# 题目

## [9.回文数](https://leetcode-cn.com/problems/palindrome-number/)

判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

**示例 1:**

```
输入: 121
输出: true
```

**示例 2:**

```
输入: -121
输出: false
解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
```

**示例 3:**

```
输入: 10
输出: false
解释: 从右向左读, 为 01 。因此它不是一个回文数。
```

**进阶:**

你能不将整数转为字符串来解决这个问题吗？

# 思路

回文数，一开始想到可以转换成字符串，然后去对比。后来看到进阶写的不转换为字符串来处理，于是想到之前做过的整数反转，那么反转后的数跟反转钱的数对比，一致自然就是回文数了。还有一点就是示例2中，明显可以看出只要是负数都不是回文数。

下面是代码：

```
func isPalindrome(_ x: Int) -> Bool {
    if x < 0 {
        return false
    }
    var vx = x
    var res = 0
    while vx != 0 {
        let n = vx % 10
        res = res * 10 + n
        vx = vx / 10
    }
    return res == x
}
```

提交后耗时 32ms ，战胜了98.77% 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/9.PalindromeNumber/code.swift)




