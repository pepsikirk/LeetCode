
import Foundation

func maxArea(_ height: [Int]) -> Int {
    var res = 0
    var left = 0
    var right = height.count - 1
    while left != right {
        let leftValue = height[left]
        let rightValue = height[right]
        let length = right - left
        let min: Int
        if leftValue > rightValue {
            right -= 1
            min = rightValue
        } else {
            left += 1
            min = leftValue
        }
        res = max(res, min * length)
    }
    return res
}

let res = maxArea([1,8,6,2,5,4,8,3,7])

print(res)
