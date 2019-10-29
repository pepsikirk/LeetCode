
import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    var res = 0
    for num in nums {
        res = res ^ num
    }
    return res
}

let res = singleNumber([4,1,2,1,2])

print(res)
