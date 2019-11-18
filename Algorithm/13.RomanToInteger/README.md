# 题目

## [13.罗马数字转整数](https://leetcode-cn.com/problems/roman-to-integer/)

罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。

```
字符          数值
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
```


例如， 罗马数字 2 写做 `II` ，即为两个并列的 1。12 写做 `XII` ，即为 `X` + `II` 。 27 写做  `XXVII`, 即为 `XX` + `V` + `II` 。

通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 `IIII`，而是 `IV`。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 `IX`。这个特殊的规则只适用于以下六种情况：

- I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。

- X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。 

- C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。

给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。

示例 1:

```
输入: "III"
输出: 3
```


示例 2:

```
输入: "IV"
输出: 4
```


示例 3:

```
输入: "IX"
输出: 9
```


示例 4:

```
输入: "LVIII"
输出: 58
解释: L = 50, V= 5, III = 3.
```


示例 5:

```
输入: "MCMXCIV"
输出: 1994
解释: M = 1000, CM = 900, XC = 90, IV = 4.
```



# 思路

这题跟上一题思路类似，还是先把对应的数据列出，然后遍历字符串，首先取2个字符串，如果匹配就加上，然后继续遍历，不匹配就取一个字符串对应的数字加上去。



最后代码如下:

```
func romanToInt(_ s: String) -> Int {
    let romansDict = ["M":1000, "CM":900, "D":500, "CD":400, "C":100, "XC":90, "L":50, "XL":40, "X":10, "IX":9, "V":5, "IV":4, "I":1]
    var res = 0
    var i = 0
    while i < s.count {
        let one = String(s[s.index(s.startIndex, offsetBy:i)])

        if i + 1 < s.count, let num = romansDict[one + String(s[s.index(s.startIndex, offsetBy:i + 1)])] {
            res += num
            i += 2
        } else {
            res += romansDict[one]!
            i += 1
        }
    }
    return res
}
```

提交后结果为，耗时 36 ms ，超过了 89.66 %的用户。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/14.LongestCommonPrefix/code.swift)




