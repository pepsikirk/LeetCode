# 题目

## [67.二进制求和](https://leetcode-cn.com/problems/add-binary/)

给定两个二进制字符串，返回他们的和（用二进制表示）。

输入为非空字符串且只包含数字 1 和 0。

示例 1:

```
输入: a = "11", b = "1"
输出: "100"
```


示例 2:

```
输入: a = "1010", b = "1011"
输出: "10101"
```

# 思路

这道题我的思路很直接，就是直接遍历2个字符串，每次删除获取并删除最后一个字符串数字，然后相加，注意要进位就可以了。

    func addBinary(_ a: String, _ b: String) -> String {
        var res = ""
        var addNum = 0
        var aChars = Array(a)
        var bChars = Array(b)
        
        while aChars.count > 0 || bChars.count > 0 {
            var aNum = 0, bNum = 0
            if aChars.count > 0 {
                aNum = aChars.removeLast().wholeNumberValue!
            }
            if bChars.count > 0 {
                bNum = bChars.removeLast().wholeNumberValue!
            }
            let num = aNum + bNum + addNum
            addNum = num/2
            res = "\(num % 2)" + res
        }
        if addNum != 0 {
            res = "1" + res
        }
        return res
    }
提交后成功。用时 16 ms ，战胜了 97.22 % 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/67.AddBinary/code.swift)




