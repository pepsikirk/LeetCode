
import Foundation

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var cNum = Int.max
    
    var i = nums.count - 1
    while i >= 0 {
        let num = nums[i]
        if cNum == num {
            nums.remove(at: i)
        } else {
            cNum = num
        }
        i -= 1
    }
    
    return nums.count
}

var nums = [0,0,1,1,1,2,2,3,3,4]
let res = removeDuplicates(&nums)

print(res)
