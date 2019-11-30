# 题目

## [买卖股票的最佳时机](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/)

给定一个数组，它的第 *i* 个元素是一支给定股票第 *i* 天的价格。

如果你最多只允许完成一笔交易（即买入和卖出一支股票），设计一个算法来计算你所能获取的最大利润。

注意你不能在买入股票前卖出股票。

**示例 1:**

```
输入: [7,1,5,3,6,4]
输出: 5
解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
```

**示例 2:**

```
输入: [7,6,4,3,1]
输出: 0
解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
```

# 思路

这道题比较简单，只需要遍历一次，遍历的时候一个变量记录最小值，一个变量记录最大的差，每次遍历比较即可。

下面是代码：

```
func maxProfit(_ prices: [Int]) -> Int {
    var maxResult = 0
    var minValue = Int.max
    
    for price in prices {
        minValue = min(minValue, price)
        maxResult = max(maxResult, price - minValue)
    }
    
    return maxResult
}
```

提交后通过，耗时 44 ms ，战胜了 92.24 % 的 Swift 提交记录

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/78.Subsets/code.swift)




