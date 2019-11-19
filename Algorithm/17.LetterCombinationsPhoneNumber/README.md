# 题目

## [17. 电话号码的字母组合](https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number/)

给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。

给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。

<img src="https://assets.leetcode-cn.com/aliyun-lc-upload/original_images/17_telephone_keypad.png" alt="img" style="zoom:50%;" />

示例:

```
输入："23"
输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
```

说明:
尽管上面的答案是按字典序排列的，但是你可以任意选择答案输出的顺序。

# 思路

这道题可以转换为一个二维数组穷举遍历。首先把数字对应的字符串一一取出来，组成一个二维数组。然后2个循环遍历二维数组里面的元素，因为每多一个遍历一个数组，都需要将每一个元素取出来再加上新的字符数组的数。所以可以创建一个新的数组来装新创建的数，最后新的数组就是下一次遍历需要的数组，完成后得出结果。

代码如下：

```
func letterCombinations(_ digits: String) -> [String] {
    if digits.count == 0 {
        return []
    }
    let digits = Array(digits)
    let dict = ["2": ["a", "b", "c"],
                "3": ["d", "e", "f"],
                "4": ["g", "h", "i"],
                "5": ["j", "k", "l"],
                "6": ["m", "n", "o"],
                "7": ["p", "q", "r", "s"],
                "8": ["t", "u", "v"],
                "9": ["w", "x", "y", "z"]]
    var array = [[String]]()
    for char in digits {
        array.append(dict[String(char)]!)
    }
    var res = array.first!
    for letters in array[1..<array.count] {
        var newRes = [String]()
        for letter in letters {
            for string in res {
                newRes.append(string + letter)
            }
        }
        res = newRes
    }
    return res
}
```

提交后执行用时 4 ms ，超过了 96.97% 的 Swift 提交记录。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/17.LetterCombinationsPhoneNumber/code.swift)




