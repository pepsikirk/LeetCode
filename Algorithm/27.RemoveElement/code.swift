
import Foundation

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var i = nums.count - 1
    
    while i >= 0 {
        let num = nums[i]
        if val == num {
            nums.remove(at: i)
        }
        i -= 1
    }
    
    return nums.count
}

var nums = [0,0,1,1,1,2,2,3,3,4]
let res = removeElement(&nums, 1)

print(res)
