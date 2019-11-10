
import Foundation

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    for (i, num) in nums.enumerated() {
        if num < target {
            continue
        } else {
            return i
        }
    }
    return nums.count
}

let res = searchInsert([1,2,3,4], 3)

print(res)
