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

首先想到就是可以把字符串数组中的第一个字符串从数组中取出来，作为一个获取前缀的锚点。然后再通过遍历第一个字符串来获取前缀，再遍历字符串数组，判断获取的前缀。判断失败就直接返回已经得到的公共前缀。遍历完数组后，没有返回就可以把这个字符加入到公共前缀里。

最后代码如下:

```
func longestCommonPrefix(_ strs: [String]) -> String {
    var commonPrefix = ""

    var firstString = strs[0]
    var strings = strs
    strings.removeFirst()

    for (i, char) in firstString.enumerated() {
        let index = String.Index.init(encodedOffset: i)
        let prefixString = firstString[...index]

        for string in strings {
            if !string.hasPrefix(prefixString) {
                return commonPrefix
            }
        }
        commonPrefix.append(char)
    }

    return commonPrefix
}
```

结果执行出错，第二个用例就出问题了，错误信息为  `Fatal error: Index out of range` 

看这错误提示很明显是数组越界错误，而代码里面只有 `var firstString = strs[0]` 这一句使用了数组取值，所以很显然，在函数最前面加上数组判断代码，如下，后通过了测试。

代码:

```
if strs.count == 0 {
    return ""
}
```

虽然通过了测试，但是很奇怪的是，使用时间特别久，看了下超过了 300ms ，在所有代码的排名都是最后面的，这明显不正常。于是我还是要继续优化代码。

再仔细看代码，创建新的前缀字符串时，我是使用字符串的 index 去取的，很可能是这一块耗时比较严重。要怎么才能不用 index 去取呢？很明显，我们已经有了 commonPrefix 直接在它的基础上加上 char 就可以得到最新要判断的前缀字符串了，并且遍历字符串也不再需要使用 enumerated() 方法。

最后字符串数组循环代码如下：

    for char in firstString {
        var prefixString = commonPrefix
        prefixString.append(char)
    
        for string in strings {
            if !string.hasPrefix(prefixString) {
                return commonPrefix
            }
        }
        commonPrefix = prefixString
    }
这个代码提交后跑出来的数据非常好，16ms ，超过了100%的用户。



### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/14.LongestCommonPrefix/LongestCommonPrefix.swift)



