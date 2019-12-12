
import Foundation

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    let targetIndex = nums.count - k
    var left = 0
    var right = nums.count - 1
    var nums = nums
    var res: Int? = nil
    while res == nil {
        let index = partition(nums: &nums, left: left, right: right)
        if index < targetIndex {
            left = index + 1
        } else if index > targetIndex {
            right = index - 1
        } else {
            res = nums[index]
        }
    }
    return res!
}

func partition(nums: inout [Int], left: Int, right: Int) -> Int {
    if left == right {
        return left
    }
    let randomIndex = Int.random(in: left...right)
    swap(nums: &nums, index1: left, index2: randomIndex)
    let pivot = nums[left]
    var j = left
    for i in left+1...right {
        if nums[i] < pivot {
            j += 1
            swap(nums: &nums, index1: i, index2: j)
        }
    }
    swap(nums: &nums, index1: left, index2: j)
    return j
}

func swap(nums: inout [Int], index1: Int, index2: Int) {
    let temp = nums[index1]
    nums[index1] = nums[index2]
    nums[index2] = temp
}

let res = findKthLargest([2,1], 1)
print(res)

