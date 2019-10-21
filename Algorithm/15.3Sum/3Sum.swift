import Foundation

func threeSum(_ nums: [Int]) -> [[Int]] {
    var numSet = Set<[Int]>()
    
    if nums.count < 3 {
        return []
    }
    let nums = nums.sorted()
    
    for (index1, num1) in nums.enumerated() {
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

let res = threeSum([-4,-1, -1, 0, 1, 2])
print(res)
