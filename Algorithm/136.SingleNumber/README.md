# 题目

## [只出现一次的数字](https://leetcode-cn.com/problems/single-number/)

给定一个**非空**整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

**说明：**

你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

**示例 1:**

```
输入: [2,2,1]
输出: 1
```

**示例 2:**

```
输入: [4,1,2,1,2]
输出: 4
```

# 思路

首先想到可以通过一个 Set 去装遍历的数组元素，遇到重复的就 remove ，不重复的就装进去。

下面是代码：

```
func singleNumber(_ nums: [Int]) -> Int {
    var set = Set<Int>()
    for num in nums {
        if set.contains(num) {
            set.remove(num)
        } else {
            set.insert(num)
        }
    }
    return set.first!
}
```

提交后通过。

但是题目还有说明，要求是不使用额外空间，那么使用 Set 存储肯定是不行了。

题目还特别说的“其余每个元素均出现两次“，这是一个很明显的提示，我们就可以想到使用异或运算来做。因为2个相同的数异或，就为0，相当于可以去重。

下面来看一下实现代码：

```
func singleNumber(_ nums: [Int]) -> Int {
    var res = 0
    for num in nums {
        res = res ^ num
    }
    return res
}
```

提交后通过，耗时 100 ms ，战胜了 92.06% 的 Swift 提交记录

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/136.SingleNumber/code.swift)




