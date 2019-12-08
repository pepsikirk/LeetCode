# 题目

## [39. 组合总和](https://leetcode-cn.com/problems/combination-sum/)

给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。

candidates 中的数字可以无限制重复被选取。

说明：

- 所有数字（包括 target）都是正整数。
- 解集不能包含重复的组合。 

示例 1:

```
输入: candidates = [2,3,6,7], target = 7,
所求解集为:
[
  [7],
  [2,2,3]
]
```


示例 2:

```
输入: candidates = [2,3,5], target = 8,
所求解集为:
[
  [2,2,2,2],
  [2,3,3],
  [3,5]
]
```

# 思路

这道题看到首先就想到用回溯算法来做，根据 target 值不断遍历相减，最后为 0 排序后加入Set 去重，最后返回 Set 转换的数组即可。

代码如下：

    var result = Set<[Int]>()
    var temp = [Int]()
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        dfs(candidates: candidates, target: target)
        return Array(result)
    }
    
    func dfs(candidates:[Int], target: Int) {
        if target == 0 {
            result.insert(temp.sorted())
            return
        }
        for num in candidates {
            let difference = target - num
            if difference >= 0 {
                temp.append(num)
                dfs(candidates: candidates, target: difference)
                temp.removeLast()
            }
        }
    }
提交后成功。用时 492ms ，战胜了 19.23 % 的 Swift 代码。

看到这提交后的数据，明显还要优化，那么怎么优化呢？

想到既然插入去重要排序，为何不提前到算法开始就排序，不但去重，而且还可以添加一个参数 index，遍历递归时，只要从上一次的 i 处遍历即可，这样可以减少大量无效循环。

最后代码如下：

```
var result = [[Int]]()
var temp = [Int]()

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
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
        let difference = target - num
        if difference >= 0 {
            temp.append(num)
            dfs(candidates: candidates, target: difference, index: i)
            temp.removeLast()
        }
    }
}
```

提交后成功。用时 28ms ，战胜了 100 % 的 Swift 代码。这个优化还是非常明显的。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/39.CombinationSum/code.swift)




