# 题目

## [有效的括号](https://leetcode-cn.com/problems/valid-parentheses/)

给定一个只包括 `'('`，`')'`，`'{'`，`'}'`，`'['`，`']'` 的字符串，判断字符串是否有效。

有效字符串需满足：

1. 左括号必须用相同类型的右括号闭合。
2. 左括号必须以正确的顺序闭合。

注意空字符串可被认为是有效字符串。

**示例 1:**

```
输入: "()"
输出: true
```

**示例 2:**

```
输入: "()[]{}"
输出: true
```

**示例 3:**

```
输入: "(]"
输出: false
```

**示例 4:**

```
输入: "([)]"
输出: false
```

**示例 5:**

```
输入: "{[]}"
输出: true
```

# 思路

其实这就类似一个栈的数据结构，后进先出，我们只需要使用数组模拟一个栈，就好了。

代码如下：

```
func isValid(_ s: String) -> Bool {
    var array = [Character]()
    for c in s {
        if c == "(" || c == "[" || c == "{" {
            array.append(c)
        } else if c == ")" {
            if array.count == 0 || array.removeLast() != "(" {
                return false
            }
        } else if c == "]" {
            if array.count == 0 ||  array.removeLast() != "[" {
                return false
            }
        } else if c == "}" {
            if array.count == 0 ||  array.removeLast() != "{" {
                return false
            }
        }
    }
    return array.count == 0
}
```

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/20.ValidParentheses/ValidParentheses.swift)



