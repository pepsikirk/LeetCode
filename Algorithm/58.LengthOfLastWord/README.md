# 题目

## [58. 最后一个单词的长度](https://leetcode-cn.com/problems/length-of-last-word/)

给定一个仅包含大小写字母和空格 ' ' 的字符串，返回其最后一个单词的长度。

如果不存在最后一个单词，请返回 0 。

说明：一个单词是指由字母组成，但不包含任何空格的字符串。

示例:

```
输入: "Hello World"
输出: 5
```

# 思路





    func lengthOfLastWord(_ s: String) -> Int {
        let array = Array(s)
        var i = array.count - 1
        var length = 0
        while i >= 0 {
            let last = array[i]
            if last.isWhitespace {
                if length > 0 {
                    return length
                }
            } else {
                length += 1
            }
            i -= 1
        }
        return length
    }
提交后成功。用时 12 ms ，战胜了 82.76 % 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/58.LengthOfLastWord/code.swift)




