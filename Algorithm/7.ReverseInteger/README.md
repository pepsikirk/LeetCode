# 题目

## [最长回文子串](https://leetcode-cn.com/problems/longest-palindromic-substring/)

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

回文字符串就是两边对称的字符串。思路很简单，就是遍历每一个字符串，然后获取这个字符串前后的字符串是否能够形成回文子串，就返回，对比已经最长的字符串。

代码:

```
func longestPalindrome(_ s: String) -> String {
    if s.count < 1 {
        return s
    }
    let cArray = Array(s)

    var res = ""

    for index in 0...(cArray.count - 1) {
        var left = index
        var right = index

        while left >= 0 && right < cArray.count {
            if cArray[left] != cArray[right] {
                break
            }
            left -= 1
            right += 1
        }
        let string = String(cArray[left+1...right-1])
        if string.count > res.count {
            res = string
        }
    }
    return res
}
```

这个代码提交后，报错如下

```
输入："cbbd"
输出："c"
预期："bb"
```

确实，没有处理对称回文的情况，每次遍历都需要对比2种回文字符串的情况。封装遍历方法和比较方法后完成的代码如下：

```
func longestPalindrome(_ s: String) -> String {
    if s.count < 1 {
        return s
    }
    let cArray = Array(s)

    var res = (0, 0)
    for index in 0...(cArray.count - 1) {
        let res1 = search(cArray: cArray, left: index, right: index)
        let res2 = search(cArray: cArray, left: index, right: index + 1)

        res = compare(tuple1: res1, tuple2: res)
        res = compare(tuple1: res2, tuple2: res)
    }

    return String(cArray[res.0...res.1])
}

func search(cArray: [Character], left: Int, right: Int) -> (Int, Int) {
    var left = left
    var right = right

    var start = 0
    var end = 0
    while left >= 0 && right < cArray.count {
        if cArray[left] != cArray[right] {
            break
        }
        start = left
        end = right

        left -= 1
        right += 1
    }
    return (start, end)
}

func compare(tuple1: (Int, Int), tuple2: (Int, Int)) -> (Int, Int) {
    if (tuple1.1 - tuple1.0) > (tuple2.1 - tuple2.0) {
        return tuple1
    } else {
        return tuple2
    }
}
```

这个代码提交后的数据为：耗时 216 ms ，战胜了 84.11% 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/5.LongestPalindromicSubstring/LongestPalindromicSubstring.swift)




