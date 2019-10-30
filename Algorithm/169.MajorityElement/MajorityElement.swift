
import Foundation

func majorityElement(_ nums: [Int]) -> Int {
    var res = 0
    var count = 0
    
    for num in nums {
        if count == 0 {
            res = num
        }
        if num == res {
            count += 1
        } else {
            count -= 1
        }
    }
    
    return res
}


let res = majorityElement([1])

print(res)
