
import Foundation

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

let res = fourSum([1,0,-1,0,-2,2, 1,4,5,7,8,8,12,34,5,7,7,8,2,4,0,67,23,64,234,3,6,7,-123,12,-1,-2,-3,-5,-6,-7,-8,-8], 0)

print(res)
