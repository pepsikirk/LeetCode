# 题目

## [字符串转换整数 (atoi)](https://leetcode-cn.com/problems/string-to-integer-atoi/)

给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

示例 1：

```
输入: "babad"
输出: "bab"
注意: "aba" 也是一个有效答案。
```

示例 2：

```
输入: "cbbd"
输出: "bb"
```

# 思路

这道题其实并不难，但是因为边界情况特别多，所以容易出错，所以这道题的通过率比较低。

首先是遍历字符串，然后是跳过空字符串，再确定正负号，最后再将处理过的字符串直接合并为一个数字。中间要加上各种边界判断。

代码如下：

```
func myAtoi(_ str: String) -> Int {
    var string = ""
    var sign: Int? = nil
    var hasStarted = false
    for c in str {
        if hasStarted && !c.isNumber {
            break
        }
        if c.isWhitespace {
            continue
        }
        if c == "-" || c == "+" {
            if sign != nil {
                return 0
            }
            sign = c == "-" ? -1 : 1
            hasStarted = true
            continue
        }
        if sign == nil {
            sign = 1
        }
        hasStarted = true
        if !c.isNumber {
            break
        }
        string.append(c)
    }
    
    var res = 0
    for c in string {
        res = res * 10 + c.wholeNumberValue!
        
        let num = res * sign!
        if num > Int32.max {
            return Int(Int32.max)
        } else if num < Int32.min {
            return Int(Int32.min)
        }
    }
    
    return res * (sign ?? 1)
}
```

这个代码提交后的数据为：耗时 12 ms ，战胜了 94.79% 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/8.StringToInteger(atoi)/code.swift)




