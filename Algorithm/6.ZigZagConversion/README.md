# 题目

## [7.Z 字形变换](https://leetcode-cn.com/problems/zigzag-conversion/)

将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。

比如输入字符串为 "LEETCODEISHIRING" 行数为 3 时，排列如下：

```
L   C   I   R
E T O E S I I G
E   D   H   N
```


之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"。

请你实现这个将字符串进行指定行数变换的函数：

string convert(string s, int numRows);
示例 1:

```
输入: s = "LEETCODEISHIRING", numRows = 3
输出: "LCIRETOESIIGEDHN"
```


示例 2:

```
输入: s = "LEETCODEISHIRING", numRows = 4
输出: "LDREOEIIECIHNTSG"
解释:

L     D     R
E   O E   I I
E C   I H   N
T     S     G
```

# 思路

看到这题，我首先想到这可以理解为一个字符串数组，转换为字符串二维数组，然后在按顺序合并成一个字符串数组的形式。关键就在于找到如何将数据按要求插入响应的字符串中的规律。

仔细看了看题目的转换后的 Z 形格式，就发现了规律。就是这个形状是一个 V 形不断重复的过程，然后就需要看看这个 V 形构成的规律。当 n 为 2 的时候，V 形的总次数为 2，3的时候为4，4的时候为6，观察图形，这个循环次数为 n + n - 2 ，即 2n - 2 。

那么我们在遍历整个字符串的时候，就可以判断了这个循环次数与行数的余数。当余数小于行数时，直接插入当前行。当大于余数时，插入循环次数与余数的余数行。最后直接合并字符串即可。

代码如下：

```
func convert(_ s: String, _ numRows: Int) -> String {
    if numRows <= 1 {
        return s
    }
    var arrays = Array<String>()
    for _ in 0...numRows - 1 {
        arrays.append("")
    }
    let loop = 2 * numRows - 2
    for (index, c) in s.enumerated() {
        let d = index % loop
        if d < numRows {
            arrays[d].append(c)
        } else {
            let i = loop % d
            arrays[i].append(c)
        }
    }
    return arrays.reduce("", { $0 + $1 })
}
```

这个代码提交后的数据为：耗时 84 ms ，战胜了 78.57% 的 Swift 代码。

成绩一般，但是也不是很差，我推测应该是有方法可以不是用数组缓存，直接插入的方法可以稍微快点，不过大家的时间复杂度都是 O(n) 。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/6.ZigZagConversion/code.swift)




