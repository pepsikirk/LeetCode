# 题目

## [28. 实现 strStr()](https://leetcode-cn.com/problems/implement-strstr/)

实现 strStr() 函数。

给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。

示例 1:

```
输入: haystack = "hello", needle = "ll"
输出: 2
```


示例 2:

```
输入: haystack = "aaaaa", needle = "bba"
输出: -1
```


说明:

```
当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。

对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与C语言的 strstr() 以及 Java的 indexOf() 定义相符。
```



# 思路

直接转为数组一一遍历即可。	

下面就是代码：

```
func strStr(_ haystack: String, _ needle: String) -> Int {
    if haystack.count < needle.count {
        return -1
    }
    if needle.count == 0 {
        return 0
    }
    let hArray = Array(haystack)
    let nArray = Array(needle)

    for i in 0...hArray.count - nArray.count {
        if hArray[i] == nArray[0] {
            for j in 0..<nArray.count {
                if hArray[i + j] != nArray[j] {
                    break
                }
                if j + 1 == nArray.count {
                    return i
                }
            }
        }
    }

    return -1
}
```

提交后成功。用时 16 ms ，战胜了 73.74 % 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/28.ImplementStrStr()/code.swift)




