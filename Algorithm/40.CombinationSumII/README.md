# 题目

## [40. 组合总和 II](https://leetcode-cn.com/problems/combination-sum-ii/)

给定一个数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。

candidates 中的每个数字在每个组合中只能使用一次。

说明：

- 所有数字（包括目标数）都是正整数。
- 解集不能包含重复的组合。 

示例 1:

```
输入: candidates = [10,1,2,7,6,1,5], target = 8,
所求解集为:
[
  [1, 7],
  [1, 2, 5],
  [2, 6],
  [1, 1, 6]
]
```


示例 2:

```
输入: candidates = [2,5,2,1,2], target = 5,
所求解集为:
[
  [1,2,2],
  [5]
]
```



# 思路

这道题与39题一样，只是不能重复利用一个数。那么我们只需要在递归方法时将之前传的 i 改为 i+1 ，但是又会出现重复的数组。

所以还需要添加重复的元素不再遍历，并且还必须要做到能够使用多个相同的值。所以在 for 循环中加上下面代码判断即可：

```
if i > 0 && num == candidates[i - 1] && i != index {
    continue
}
```

关键是 i != index 来保证可以使用值相同的元素。

最后代码如下：

```
var result = [[Int]]()
var temp = [Int]()

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    dfs(candidates: candidates.sorted(), target: target, index: 0)
    return result
}

func dfs(candidates:[Int], target: Int, index: Int) {
    if target == 0 {
        result.append(temp)
        return
    }
    for i in index..<candidates.count {
        let num = candidates[i]
        if i > 0 && num == candidates[i - 1] && i != index {
            continue
        }
        let difference = target - num
        if difference >= 0 {
            temp.append(num)
            dfs(candidates: candidates, target: difference, index: i + 1)
            temp.removeLast()
        }
    }
}
```

提交后成功。用时 28ms ，战胜了 100 % 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/40.CombinationSumII/code.swift)




