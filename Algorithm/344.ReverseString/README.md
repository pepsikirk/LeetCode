# 题目

## [344. 反转字符串](https://leetcode-cn.com/problems/reverse-string/)

编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 `char[]` 的形式给出。

不要给另外的数组分配额外的空间，你必须**[原地](https://baike.baidu.com/item/原地算法)修改输入数组**、使用 O(1) 的额外空间解决这一问题。

你可以假设数组中的所有字符都是 [ASCII](https://baike.baidu.com/item/ASCII) 码表中的可打印字符。

**示例 1：**

```
输入：["h","e","l","l","o"]
输出：["o","l","l","e","h"]
```

**示例 2：**

```
输入：["H","a","n","n","a","h"]
输出：["h","a","n","n","a","H"]
```

# 思路

这道题很简单，只要对数组双向遍历，一边遍历一边交换值即可。

代码如下：

```
func reverseString(_ s: inout [Character]) {
    var left = 0
    var right = s.count - 1
    while left < right {
        let leftNum = s[left]
        s[left] = s[right]
        s[right] = leftNum
        left += 1
        right -= 1
    }
}
```

提交后通过，耗时 340 ms ，战胜了 98.87% 的 Swift 提交。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/231.PowerOfTwo/code.swift)




