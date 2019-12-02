# 题目

## [62. 不同路径](https://leetcode-cn.com/problems/unique-paths/)

一个机器人位于一个 *m x n* 网格的左上角 （起始点在下图中标记为“Start” ）。

机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。

问总共有多少条不同的路径？

![img](https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2018/10/22/robot_maze.png)

例如，上图是一个7 x 3 的网格。有多少可能的路径？

**说明：***m* 和 *n* 的值均不超过 100。

**示例 1:**

```
输入: m = 3, n = 2
输出: 3
解释:
从左上角开始，总共有 3 条路径可以到达右下角。
1. 向右 -> 向右 -> 向下
2. 向右 -> 向下 -> 向右
3. 向下 -> 向右 -> 向右
```

**示例 2:**

```
输入: m = 7, n = 3
输出: 28
```

# 思路

类似走楼梯，这道题每次只能往下或者往右走一步，然后走了以后 m 或 n 减1。那么它的走法就为 f(m,n) = f(m-1,n) + f(n-1,m)。

而如果当前遍历为m时，f(n-1,m) 即为上一次的 f(n,m)，所以可以得到 f(m) = f(m-1) + f(m)(上一次的状态)。那么就可以写出相应代码了。

代码如下：

    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var result = Array.init(repeating: 1, count: n)
        
        for i in 1..<m {
            for j in 1..<n {
                result[j] += result[j-1]
            }
            print(i)
        }
        
        return result[n-1]
    }
提交后成功。用时 0 ms ，战胜了 100 % 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/62.UniquePaths/code.swift)




