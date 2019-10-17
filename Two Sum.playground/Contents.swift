import UIKit

/*两数之和
给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 */

//初始代码，能够通过playground，但是LeetCode超时，应该是时间复杂度太高，所以还需要优化
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
//优化代码，想到了直接用Dictionary的key作为数字，这样可以快速查找是否存在，LeetCode通过
//此方法时间复杂度为O(n)，空间复杂度为O(n)
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


twoSum([2,7,11,15], 9)
twoSum2([2,7,11,15], 9)
