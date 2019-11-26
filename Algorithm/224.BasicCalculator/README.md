# 题目

## [224. 基本计算器](https://leetcode-cn.com/problems/basic-calculator/)

实现一个基本的计算器来计算一个简单的字符串表达式的值。

字符串表达式可以包含左括号 ( ，右括号 )，加号 + ，减号 -，非负整数和空格  。

示例 1:

```
输入: "1 + 1"
输出: 2
```


示例 2:

```
输入: " 2-1 + 2 "
输出: 3
```


示例 3:

```
输入: "(1+(4+5+2)-3)+(6+8)"
输出: 23
```


说明：

- 你可以假设所给定的表达式都是有效的。
- 请不要使用内置的库函数 eval。

# 思路

题目说了只包含左括号 ( ，右括号 )，加号 + ，减号 -，非负整数和空格  。就简单了很多，我们只需要将括号展开就可以直接计算了。

在处理括号时，只需要考虑括号前的符号，如果是-，那么就反转符号，如果是+就不需要反转。

由于括号有多层，所以我们需要用一个数组来存储每一层的符号，当符号为(时储存，为)时删除，括号展开后，每一次的结果+=当前的符号乘以当前需要处理的数字。

最后还要在计算一次，因为我们是每次遍历到+或-时才计算上一次的值。

最后的代码如下：

```
func calculate(_ s: String) -> Int {
    var array = [Int]()
    var result = 0
    var num = 0
    var sign = 1
    for c in s {
        switch c {
        case "+", "-":
            result += num * sign
            sign = c == "+" ? 1 : -1
            if (array.last != nil) {
                sign *= array.last!
            }
            num = 0
        case "(":
            array.append(sign)
        case ")":
            array.removeLast()
        case " ":
            break
        default:
            num = num * 10 + c.wholeNumberValue!
        }
    }
    return result + num * sign
}

```

提交后通过，耗时 68 ms ，战胜了 100.00% 的 Swift 提交。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/224.BasicCalculator/code.swift)




