# 题目

## [70. 爬楼梯](https://leetcode-cn.com/problems/climbing-stairs/)

假设你正在爬楼梯。需要 *n* 阶你才能到达楼顶。

每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

**注意：**给定 *n* 是一个正整数。

**示例 1：**

```
输入： 2
输出： 2
解释： 有两种方法可以爬到楼顶。
1.  1 阶 + 1 阶
2.  2 阶
```

**示例 2：**

```
输入： 3
输出： 3
解释： 有三种方法可以爬到楼顶。
1.  1 阶 + 1 阶 + 1 阶
2.  1 阶 + 2 阶
3.  2 阶 + 1 阶
```

# 思路

最近做了好几道回溯算法，于是看到这道题，第一时间就想到使用回溯和dfs来做。

一个全局变量 count 来记录已经计算出来的次数。递归的参数是 n 为当前还剩余的步数。结束条件为 n=0，即步数为 0 。递归的条件是当前可以选择走1步，即递归 n-1 ，或者当 n>=2 时，可以选择走 2 步，即递归 n-2 。最后完成。

下面是代码：

```
var count = 0

func climbStairs(_ n: Int) -> Int {
    recursion(n: n)
    return count
}

func recursion(n: Int) {
    if n == 0 {
        count += 1
        return
    } else if n >= 2 {
        recursion(n: n-2)
    }
    recursion(n: n-1)
}
```

执行代码是成功的，但是提交以后，结果是超出时间限制。很明显这个时间复杂度是2的 n 次方。过大了。

这道题是一道动态规划的题目，下面就用动态规划来做这道题。

动态规划首先要找到当前状态与之前状态的关系。

我们先改写代码，不使用全局变量 count 记录次数，而是直接使用返回值递归相加得出。

还是 n 记录剩余次数，如果 n=0 那么结果就为 1。每次走一步，加上每次走两步相加，就可以为返回值。

代码如下：

```
func climbStairs(_ n: Int) -> Int {
    return recursion(n: n)
}

func recursion(n: Int) -> Int {
    var num = 0
    if n == 0 {
        return 1
    } else if n >= 2 {
        num = recursion(n: n-2)
    }
    return num + recursion(n: n-1)
}
```

这里其实已经得出了关系，但是因为条件阻隔，还不够直观，我们改写小条件。

```
func climbStairs(_ n: Int) -> Int {
    return recursion(n: n)
}

func recursion(n: Int) -> Int {
    if n == 0 {
        return 1
    } else if n < 0 {
        return 0
    }
    return recursion(n: n-2) + recursion(n: n-1)
}
```

这是很明显得出了 f(n) = f(n-1)+f(n-2) ，这实际上就是斐波那契数列。这是就可以使用动态规划来写代码了。

已知 n 为 0，走法是 0 ，n 为 1 走法是 1，那么根据 f(n) = f(n-1)+f(n-2) ，就可以得出 f(2) = 1，并且以此类推，就可以写出代码。value1 为 f(n-2)，value2 为 f(n-1)，res 为 f(n) ，最后可以得出一下代码。

```
func climbStairs(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    var value1 = 0
    var value2 = 1
    var result = value1 + value2
    for _ in 1..<n {
        value1 = value2
        value2 = result
        result = value1 + value2
    }
    return result
}
```

提交后通过，耗时 0 ms ，战胜了 100.00 % 的 Swift 提交记录

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/70.ClimbingStairs/code.swift)




