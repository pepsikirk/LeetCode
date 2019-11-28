# 题目

## [46. 全排列](https://leetcode-cn.com/problems/permutations/)

给定一个**没有重复**数字的序列，返回其所有可能的全排列。

**示例:**

```
输入: [1,2,3]
输出:
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]
```

# 思路

这道题也是回溯算法的经典题目，我们还是用回溯算法来做。

这道题也是一个树，第一排是 n 个元素，第二排是 n-1 个元素，第三排是 n - 2 个元素，以此类推，最后的总元素是 n! ，即 n 的阶乘。

于是我们想到第一层就是要遍历 n 次，那么循环可以写为 `for i in 0...nums.count - 1`。下一层是 n-1 那么我们只需要将已经遍历的元素从 nums 中抽取出来，然后再使用 nums 进行递归就可以了。

那么很明显，递归的结束条件就可以是 nums 为空。

至于数据，定义 result 为最终结果数组，path 为当前遍历的数组。而在 remove 元素的时候，就可以将当前的元素加入 path ，而递归结束，就可以将 path 加入 result即可。

当然不能忘记回溯算法的数据回复上一层的状态，这样才不会数据错乱。

最后代码如下：

    var result = [[Int]]()
    var path = [Int]()
    
    func permute(_ nums: [Int]) -> [[Int]] {
        dfs(nums: nums)
        return result
    }
    
    func dfs(nums: [Int]) {
        if (nums.count == 0) {
            result.append(path)
            return
        }
        for i in 0...nums.count - 1 {
            var nums = nums
            path.append(nums.remove(at: i))
            dfs(nums: nums)
            path.removeLast()
        }
    }
提交后成功。用时 24 ms ，战胜了 95.18 % 的 Swift 代码。

## 再尝试用迭代做这道题：

迭代的思想是通过插入来完成，1 前后插 2 ，得到 1 2，2 1。2 1，1 2，前中后插入 3 得 3 2 1, 2 3 1, 2 1 3 和 3 1 2, 1 3 2, 1 2 3。已至此类推就可以得出解，下面是代码描述。

首先先给 result 一个初始值 nums[0]。

然后从第二个元素开始遍历数组， 再遍历之前得到的结果数组 r，再遍历 r 然后在 r 的每个元素插入 num 后，加入 path，最后将 path 赋值为新的 result即可。

下面是代码：

```
func permute(_ nums: [Int]) -> [[Int]] {
    var result = [[nums[0]]]
    if nums.count == 1 {
        return result
    }
    for i in 1...nums.count-1 {
        let num = nums[i]
        var path = [[Int]]()
        for r in result {
            for j in 0...r.count {
                var r = r
                r.insert(num, at: j)
                path.append(r)
            }
        }
        result = path
    }
    return result
}
```

提交后成功。用时 16 ms ，战胜了 100 % 的 Swift 代码。

看来一般来说迭代都是比递归要快的，并且内存占用也更少。当然也有可能是偶尔的误差导致的。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/46.Permutations/code.swift)




