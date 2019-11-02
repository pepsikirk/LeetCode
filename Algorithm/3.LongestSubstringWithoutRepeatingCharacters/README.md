# 题目

## [3. 无重复字符的最长子串](https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/)

给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

示例 1:

```
输入: "abcabcbb"
输出: 3 
解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
```


示例 2:

```
输入: "bbbbb"
输出: 1
解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
```


示例 3:

```
输入: "pwwkew"
输出: 3
解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
```



# 思路

首先想到最简单的方法就是通过遍历字符串，直接找到后面相同的字符，然后不断对比长度，得出长度最长的。代码如下，我这里使用了 Set 来保存当前已经遍历的字符串。

```
func lengthOfLongestSubstring(_ s: String) -> Int {
    let s = Array(s)
    var res = 0
    var set = Set<Character>()
    for i in 0...s.count {
        set.removeAll()
        var index = i
        var isBreak = false
        while index < s.count {
            let c = s[index]
            if set.contains(c) {
                if set.count > res {
                    res = set.count
                }
                isBreak = true
                break
            }
            set.insert(c)
            index += 1
        }
        if !isBreak && set.count > res {
            res = set.count
        }
    }
    return res
}
```

提交后通过，但是用时达到了 1088ms ，只超过了 8% 的代码，时间复杂度是 O(n²) 。明显还有优化的空间。

怎样才能只遍历一次就解决问题呢？这里涉及到`滑动窗口`的概念了。我们遍历 `abcabc`的时候，`abc`是没问题的，但是再遍历到 `abca` 的时候就出现重复了。这时候就可以将第一个标志位左移一位来解决，变成 `bca`，以此类推，不断移动窗口就可以在一次遍历中就能判断出最长长度了。

代码如下：

```
func lengthOfLongestSubstring(_ s: String) -> Int {
    let s = Array(s)
    var maxLength = 0
    var left = 0
    var index = 0

    while index < s.count {
        var l = left
        while l < index {
            if s[l] == s[index] {
                left = l + 1
                break
            }

            l += 1
        }

        if index - left + 1 > maxLength {
            maxLength = index - left + 1
        }

        index += 1
    }

    return maxLength
}
```

提交后耗时 20ms ，战胜了 99.04% 的 Swift 代码。

看着两次提交后的结果相差如此悬殊，这才是算法的力量呀！

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/3.LongestSubstringWithoutRepeatingCharacters/LongestSubstringWithoutRepeatingCharacters.swift)




