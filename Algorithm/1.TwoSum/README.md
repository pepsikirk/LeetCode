#题目

1.两数之和

给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。

示例:

```
给定 nums = [2, 7, 11, 15], target = 9
因为 nums[0] + nums[1] = 2 + 7 = 9
所以返回 [0, 1] 
```
#思路
最简单粗暴就是2个for循环，找到符合条件的就加入数组，最后返回数组，这样时间复杂度是O(n²)
不过我考虑优化一下，就是多创建一个数组，把已经遍历过的元素加到已经循环过的数组里面，然后只需要遍历原数组和已经遍历的数组，可以减少循环次数
代码:

```
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var sums: [Int] = []
    var hasNums = [Int: Int]()
    for (index, num) in nums.enumerated() {
        var hasAppendNum: (Int, Int)?
        for (hasIndex, hasNum) in hasNums {
            if num + hasNum == target {
                sums.append(hasIndex)
                sums.append(index)
                hasAppendNum = (hasIndex, hasNum)
                break
            }
        }
        if hasAppendNum != nil {
            hasNums.removeValue(forKey: hasAppendNum!.0)
        } else {
            hasNums[index] = num
        }
    }
    return sums
}
```

结果是能够通过 playground，但是提交 LeetCode 超时，应该是时间复杂度太高，所以还需要继续优化代码

想到可以直接用 Dictionary 的 key 作为数字，这样可以快速查找是否存在， LeetCode 通过。
此方法时间复杂度为O(n)，空间复杂度为O(n)
代码:

```
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var sums: [Int] = []
    var hasNums = [Int: Int]()
    for (index, num) in nums.enumerated() {
        var hasAppendNum: Int?
        if let hasIndex = hasNums[target - num] {
            sums.append(hasIndex)
            sums.append(index)
            hasAppendNum = hasIndex
        }
        if hasAppendNum != nil {
            hasNums.removeValue(forKey: hasAppendNum!)
        } else {
            hasNums[num] = index
        }
    }
    return sums
}
```

最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/1.TwoSum/TwoSum.swift)




