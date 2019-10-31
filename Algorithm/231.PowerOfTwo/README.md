# 题目

## [231.2的幂](https://leetcode-cn.com/problems/power-of-two/)

给定一个整数，编写一个函数来判断它是否是 2 的幂次方。

**示例 1:**

```
输入: 1
输出: true
解释: 20 = 1
```

**示例 2:**

```
输入: 16
输出: true
解释: 24 = 16
```

**示例 3:**

```
输入: 218
输出: false
```

# 思路

最容易理解的做法，就是循环，不断用 2 的幂去与 n 对比，直到 n 等于 x 就是 true，而 x 比 n 还大以后，就可以是 false 了。

代码如下：

```
func isPowerOfTwo(_ n: Int) -> Bool {
    var x = 1
    while x > 0 {
        if n == x {
            return true
        } else if (x > n) {
            return false
        } else {
            x *= 2
        }
    }
    return false
}
```

提交后通过，耗时 12ms ，战胜了 45.00% 的 Swift 提交。看样子应该是有更简单的做法了

递归的时间复杂度也是 O(n) ，实际比循环还快，耗时 12ms ，战胜了 100% 的 Swift 提交。估计也是因为用例比较少，正常的时间波动。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/231.PowerOfTwo/PowerOfTwo.swift)




