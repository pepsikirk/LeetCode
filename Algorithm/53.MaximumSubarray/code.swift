
import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    var res = Int.min
    var sum = 0
    for num in nums {
        sum = max(sum + num, num)
        res = max(res, sum)
    }
    return res
}

let res = maxSubArray([1,2,3,4,-3])

print(res)
