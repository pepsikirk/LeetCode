# 题目

## [22. 括号生成](https://leetcode-cn.com/problems/generate-parentheses/)

给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。

例如，给出 n = 3，生成结果为：

```
[
  "((()))",
  "(()())",
  "(())()",
  "()(())",
  "()()()"
]
```

# 思路

这题我不用递归是很难做出来了，这里需要用到回溯算法。

因为使用了递归函数，先确定递归参数，然后递归终止条件，最后核心就是内部的算法了。

这道题，我们首先我们需要一个字符串作为拼接的参数，最后加入到结果数组中，然后是需要一个代表左边和右边的指针，这就是参数了。

那么就是结束条件，我们可以先添加左边括号，然后再添加右边的括号，那么结束条件可以为 `right = 0`，实际此时 left 也是 0。

最后就是算法了，我们只要添加哪边就将哪边的数量减一，然后不断进行递归，最后就可以得到结果了。

下面就是代码：

```
var res = [String]()

func generateParenthesis(_ n: Int) -> [String] {
    dfs(string: "", left: n, right: n)
    return res
}

func dfs(string: String, left: Int, right: Int) {
    if right == 0 {
        res.append(string)
        return
    }
    if right > left {
        dfs(string: string + ")", left: left, right: right - 1)
    }
    if left > 0 {
        dfs(string: string + "(", left: left - 1, right: right)
    }
}
```

提交后成功。用时 16 ms ，战胜了 96.30% 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/23.MergeKSortedListsr/code.swift)




