# 题目

## [47. 全排列 II](https://leetcode-cn.com/problems/permutations-ii/)

给定一个可包含重复数字的序列，返回所有不重复的全排列。

**示例:**

```
输入: [1,1,2]
输出:
[
  [1,1,2],
  [1,2,1],
  [2,1,1]
]
```

# 思路

这道题在 [46. 全排列](https://leetcode-cn.com/problems/permutations/) 的基础上进行修改。

因为可能出现重复元素，所以就要在想办法去重，用 Set 是一个办法，比较简单。还有一个办法就是可以排序，排序以后通过判断当前数字与上一个数字相同就不处理来做。

下面就用第二个方法来做，最后代码如下：

    var result = [[Int]]()
    var path = [Int]()
    
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        dfs(nums: nums.sorted())
        return result
    }
    
    func dfs(nums: [Int]) {
        if (nums.count == 0) {
            result.append(path)
            return
        }
        for i in 0...nums.count-1 {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            var nums = nums
            path.append(nums.remove(at: i))
            dfs(nums: nums)
            path.removeLast()
        }
    }
提交后成功。用时 48 ms ，战胜了 90.47 % 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/47.PermutationsII/code.swift)




