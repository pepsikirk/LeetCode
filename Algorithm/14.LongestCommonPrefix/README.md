# 题目

## [14. 最长公共前缀](https://leetcode-cn.com/problems/longest-common-prefix/)

编写一个函数来查找字符串数组中的最长公共前缀。

如果不存在公共前缀，返回空字符串 `""`。

**示例 1:**

```
输入: ["flower","flow","flight"]
输出: "fl"
```

**示例 2:**

```
输入: ["dog","racecar","car"]
输出: ""
解释: 输入不存在公共前缀。
```

**说明:**

所有输入只包含小写字母 `a-z` 。

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




