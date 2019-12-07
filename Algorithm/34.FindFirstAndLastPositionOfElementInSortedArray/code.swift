
import Foundation

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count == 0 {
        return [-1, -1]
    }
    var left = 0
    var right = nums.count - 1
    var index: Int? = nil
    while left + 1 < right {
        let mid = left + (right - left)/2
        let midNum = nums[mid]
        
        if midNum == target {
            index = mid
            break
        } else if target < midNum {
            right = mid
        } else {
            left = mid
        }
    }
    
    if index == nil {
        if nums[left] == target {
            index = left
        } else if nums[right] == target {
            index = right
        } else {
            return [-1,-1]
        }
    }
    
    var start = index!
    var end = index!
    while start >= 0 && nums[start] == target {
        start -= 1
    }
    start += 1
    while end < nums.count && nums[end] == target {
        end += 1
    }
    end -= 1
    return [start, end]
}

var res = searchRange([5,7,7,8,8,10],8)
print(res)

