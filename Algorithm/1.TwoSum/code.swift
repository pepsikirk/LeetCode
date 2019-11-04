import Foundation

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
