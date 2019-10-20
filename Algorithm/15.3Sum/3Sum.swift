import Foundation

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
    
threeSum([-1, 0, 1, 2, -1, -4])