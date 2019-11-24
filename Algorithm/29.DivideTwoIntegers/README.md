# 题目

## [29. 两数相除](https://leetcode-cn.com/problems/divide-two-integers/)

给定两个整数，被除数 dividend 和除数 divisor。将两数相除，要求不使用乘法、除法和 mod 运算符。

返回被除数 dividend 除以除数 divisor 得到的商。

示例 1:

```
输入: dividend = 10, divisor = 3
输出: 3
```


示例 2:

```
输入: dividend = 7, divisor = -3
输出: -2
```


说明:

- 被除数和除数均为 32 位有符号整数。
- 除数不为 0。
- 假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−231,  231 − 1]。本题中，如果除法结果溢出，则返回 231 − 1。

# 思路

首先想到的就是，不能乘除，但是可以减嘛，减的次数最终就是除数了。

首先先判断最终的符号，然后将两个值都取绝对值开始遍历减，最后根据符号取正负即可。

下面就是代码：

```
func divide(_ dividend: Int, _ divisor: Int) -> Int {
    let sign = (divisor > 0 && dividend > 0) || (divisor < 0 && dividend < 0)
    var count = 0
    var dividend = abs(dividend)
    let divisor = abs(divisor)
    while dividend >= divisor {
        dividend -= divisor
        count += 1
    }
    return sign ? count : -count
}
```

提交后失败，原因是超时。在用例 `-2147483648, -1`中超时了，很明显，当被除数很大，除数很小的时候，这个遍历会运行的次数太多了，必须要优化。

我们每次只减1肯定是效率很低的，那么我们需要想办法让每次能够减多个。那就需要使用乘法，但是题目又不给用乘法。于是想到了可以使用位运算。

位运算时，数字往左移动一位就相当于大2倍，就变相实现了乘法。我们只需要每次减成功之后，将减数和记录次数同时扩大2倍，再继续遍历。被减数小于减数之后，再减少2倍。不断循环就可以得到最终的除法结果。

最终代码如下：

```
func divide(_ dividend: Int, _ divisor: Int) -> Int {
    if dividend == Int32.min && divisor == -1 {
        return Int(Int32.max)
    }
    let sign = (divisor > 0 && dividend > 0) || (divisor < 0 && dividend < 0)
    var res = 0
    var dividend = abs(dividend)
    let divisor = abs(divisor)
    var count = 1
    var temp = divisor
    while dividend >= divisor {
        while dividend >= temp {
            dividend -= temp
            res += count
            count <<= 1
            temp <<= 1
        }
        count >>= 1
        temp >>= 1
    }
    return sign ? res : -res
}
```

提交后成功。用时 8 ms ，战胜了 87.72 % 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/29.DivideTwoIntegers/code.swift)




