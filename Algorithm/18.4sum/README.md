# 题目

## [18. 四数之和](https://leetcode-cn.com/problems/4sum/)

给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。

**注意：**

答案中不可以包含重复的四元组。

**示例：**

```
给定数组 nums = [1, 0, -1, 0, -2, 2]，和 target = 0。

满足要求的四元组集合为：
[
  [-1,  0, 0, 1],
  [-2, -1, 1, 2],
  [-2,  0, 0, 2]
]
```

# 思路

这题跟15题的三数之和的方法一样，还是排序后2个指针左右两边逼近。只是因为多了一个数字，所以需要再加一层循环。

```
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    if nums.count < 4 {
        return []
    }
    
    let nums = nums.sorted()
    var numSet = Set<[Int]>()
    
    for i in 0..<nums.count - 3 {
        let num1 = nums[i]
        
        for j in i + 1 ..< nums.count - 2 {
            let num2 = nums[j]
            
            var left = j + 1
            var right = nums.count - 1
            
            while left < right {
                let num3 = nums[left]
                let num4 = nums[right]
                let sum = num1 + num2 + num3 + num4
                
                if sum == target {
                    numSet.insert([num1, num2, num3, num4])
                    left += 1
                    right -= 1
                } else if (sum > target) {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
    }

    return Array(numSet)
}
```

这个方法的时间复杂度为O(n³)，提交后实际执行用时 68 ms ，超过了 71.88 % 的 Swift 代码。如果再添加一些跳过条件以后应该可以加快一些速度，不过不会有本质提高。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/18.4sum/code.swift)




