# 题目

## [66. 加一](https://leetcode-cn.com/problems/plus-one/)

给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。

最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。

你可以假设除了整数 0 之外，这个整数不会以零开头。

示例 1:

```
输入: [1,2,3]
输出: [1,2,4]
解释: 输入数组表示数字 123。
```


示例 2:

```
输入: [4,3,2,1]
输出: [4,3,2,2]
解释: 输入数组表示数字 4321。
```

# 思路

这道题只要注意进位即可，因为每个数组都有可能需要进位，所以必须要使用循环。

    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var index = digits.count - 1
    
        while index >= 0 {
            let num = digits[index]
            if num < 9 {
                digits[index] = num + 1
                return digits
            }
    
            digits[index] = 0
            index -= 1
        }
        digits.insert(1, at: 0)
        return digits
    }
提交后成功。用时 8 ms ，战胜了 94.29 % 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/66.PlusOne/code.swift)




