
import Foundation

func search(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let mid = left + (right - left) / 2;
        let midNum = nums[mid]
        if midNum == target {
            return mid
        }
        
        let leftNum = nums[left]
        if leftNum <= midNum {
            if target < midNum && target >= leftNum {
                right = mid - 1
            } else {
                left = mid + 1
            }
        } else {
            let rightNum = nums[right]
            if (target <= rightNum && target > midNum) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
    }
    
    return -1
}

var res = search([4,5,6,7,0,1,2], 0)
print(res)

