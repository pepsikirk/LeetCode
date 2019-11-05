# 题目

## [15. 三数之和](https://leetcode-cn.com/problems/3sum/) 

给定一个包含 *n* 个整数的数组 `nums`，判断 `nums` 中是否存在三个元素 *a，b，c ，*使得 *a + b + c =* 0 ？找出所有满足条件且不重复的三元组。

**注意：**答案中不可以包含重复的三元组。

```
例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，

满足要求的三元组集合为：
[
  [-1, 0, 1],
  [-1, -1, 2]
]
```

# 思路

首先想到的就是可以进行3个for循环，暴力直接解决

代码如下:

```
func threeSum(_ nums: [Int]) -> [[Int]] {
    var returnArray: [[Int]] = []

    for num1 in nums {
        for num2 in nums {
            for num3 in nums {
                if num1 + num2 + num3 == 0 {
                    returnArray.append([num1, num2, num3])
                }
            }
        }
    }

    return returnArray
}
```

运行结果如下：

```
[[-1,-1,2],[-1,0,1],[-1,1,0],[-1,2,-1],[-1,2,-1],[-1,-1,2],[0,-1,1],[0,0,0],[0,1,-1],[0,1,-1],[0,-1,1],[1,-1,0],[1,0,-1],[1,0,-1],[1,-1,0],[2,-1,-1],[2,-1,-1],[2,2,-4],[2,-1,-1],[2,-1,-1],[2,-4,2],[-1,-1,2],[-1,0,1],[-1,1,0],[-1,2,-1],[-1,2,-1],[-1,-1,2],[-4,2,2]]
```

运行结果明显与预期结果差别太大，一看就知道是条件判断没做好，导致数字重复使用。 

怎么才能防止重复使用数字呢？于是想到可以先对数组进行排序，然后每次遍历都取当前 index 后面的 index 就可以防止重复遍历一个元素。

但是这个方式还是会出现重复的数组，如在题目中给的范例 `[-1, 0, 1]`这个结果就会出现2次，因为排序后-1有2个，都可以和后面的0和1相加为0，所以还需要加上去重。我这里就是使用了 Set 来去重。插入时是插入 Set 自动去重，最后返回的时候转换为 Array 返回。

修改后的代码如下:

```
func threeSum(_ nums: [Int]) -> [[Int]] {
    var numSet = Set<[Int]>()

    let nums = nums.sorted()
    for (index1, num1) in nums.enumerated() {
        for (index2, num2) in nums[(index1 + 1)...].enumerated() {
            for num3 in nums[(index1 + index2 + 2)...] {
                if num1 + num2 + num3 == 0 {
                    numSet.insert([num1, num2, num3])
                }
            }
        }
    }

    return Array(numSet)
}
```

上面的代码虽然通过了执行，但是提交以后的结果是失败的，因为超出了时间限制，看来是暴力法太粗暴了，时间复杂度达到了 O(n³) ，所以还需要继续优化代码。

于是我想到了之前 TwoSum 时，通过字典的 key 来保存相加需要的数字来判断的办法。这个优化后的代码应该是可以达到 O(n²) 的时间复杂度的。于是就开始写代码，加一个字典，先存好所有数字作为 key，然后2个循环获取数字。

优化后的代码如下：

    func threeSum(_ nums: [Int]) -> [[Int]] {
        var numSet = Set<[Int]>()
        var numDictionary = [Int: Int]()
        let nums = nums.sorted()
    
        for (index, num) in nums.enumerated() {
            numDictionary[num] = index
        }
    
        for (index1, num1) in nums.enumerated() {
            for (index2, num2) in nums[(index1 + 1)...].enumerated() {
                let num = 0-num1-num2
                if let index = numDictionary[num] {
                    if index > index1 + index2 + 1 {
                        numSet.insert([num1, num2, num])
                    }
                }
            }
        }
    
        return Array(numSet)
    }
结果还是没有通过提交，还是超过了时间限制。看了下详情，是在`[0,0 …… 0,0]`(几百个0)这个用例中没有执行完成的。与是对这个情况进行针对性的优化，判断如果已经有重复的数字处理过就不再进行处理。

最后代码如下：

    func threeSum(_ nums: [Int]) -> [[Int]] {
        var numSet = Set<[Int]>()
        var numDictionary = [Int: Int]()
        let nums = nums.sorted()
    
        for (index, num) in nums.enumerated() {
            numDictionary[num] = index
        }
    
        for (index1, num1) in nums.enumerated() {
            if index1 > 0 && num1 == nums[index1 - 1] {
                continue
            }
            for (index2, num2) in nums[(index1 + 1)...].enumerated() {
                let num = 0 - num1 - num2
                if let index = numDictionary[num] {
                    if index > index1 + index2 + 1 {
                        numSet.insert([num1, num2, num])
                    }
                }
            }
        }
    
        return Array(numSet)
    }
这个代码虽然最后通过了测试，但是耗时1828ms，只战胜了14.66%的 Swift 提交记录。所以代码优化的空间应该还是很大的，感觉应该还可以通过类似快排的方式进行优化。我未来还会针对这个代码修改，争取达到主流水准。

# 后续

后续做了16题后，想到类似的解法15题也能用，就也拿来试了下，果然，最后结果耗时是272ms，战胜了90.87%的Swift代码。

```
func threeSum(_ nums: [Int]) -> [[Int]] {
    var numSet = Set<[Int]>()
    
    if nums.count < 3 {
        return []
    }
    let nums = nums.sorted()
    
    for (index1, num1) in nums.enumerated() {
    		//大于0的部分不需要处理，因为都大于0相加不可能小于0
        if num1 > 0 {
            break
        }
        if index1 > 0 && num1 == nums[index1 - 1] {
            continue
        }
        
        var index2 = index1 + 1
        var index3 = nums.count - 1
        
        while index2 < index3 {
            let num2 = nums[index2]
            let num3 = nums[index3]
            let sum = num1 + num2 + num3
            
            if sum == 0 {
                numSet.insert([num1, num2, num3])
                index2 += 1
                index3 -= 1
            } else if (sum > 0) {
                index3 -= 1
            } else {
                index2 += 1
            }
        }
    }
    
    return Array(numSet)
}
```



### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/15.3Sum/code.swift)




