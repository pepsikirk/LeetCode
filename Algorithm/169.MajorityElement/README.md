# 题目

## [169.求众数](https://leetcode-cn.com/problems/majority-element/)

给定一个大小为 *n* 的数组，找到其中的众数。众数是指在数组中出现次数**大于** `⌊ n/2 ⌋` 的元素。

你可以假设数组是非空的，并且给定的数组总是存在众数。

**示例 1:**

```
输入: [3,2,3]
输出: 3
```

**示例 2:**

```
输入: [2,2,1,1,1,2,2]
输出: 2
```

# 思路

我们可以用一个字典存储数字的次数，key 为数字，value 为次数，然后每次判断是不是最大的数字和次数，然后把最大的赋值。最后返回最大的数字即可。

代码如下：

    func majorityElement(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums.first!
        }
        var dict = [Int:Int]()
    
        var maxNum = 0
        var maxCount = 0
        for num in nums {
            if let count = dict[num] {
                let count = count + 1
                dict[num] = count
                if count > maxCount {
                    maxCount = count
                    maxNum = num
                }
            } else {
                dict[num] = 1
            }
        }
    
        return maxNum
    }
提交后通过，耗时 188 ms ，战胜了 84.39% 的 Swift 提交记录。

再想了下，这个代码并没有用到题目中所说的”众数是出现次数大于 n/2 的元素“这个条件，只是得到了出现最多的数，所以应该还有优化的空间，我们再看看。

既然出现最多，那么只要记录一个变量，每次不同就 -1 ，相同就 +1 ，这样最后只要出现次数能够超过一半的数，必然会让变量大于 0 ，就可以得到出现最多的元素了。

最后代码如下：

```
func majorityElement(_ nums: [Int]) -> Int {
    var res = 0
    var count = 0
    
    for num in nums {
        if count == 0 {
            res = num
        }
        if num == res {
            count += 1
        } else {
            count -= 1
        }
    }
    
    return res
}
```

提交后通过，耗时 168 ms ，战胜了94.80% 的 Swift 提交记录。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/169.MajorityElement/code.swift)




