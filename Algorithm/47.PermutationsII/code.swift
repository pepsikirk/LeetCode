
import Foundation

var result = [[Int]]()
var path = [Int]()

func permuteUnique(_ nums: [Int]) -> [[Int]] {
    dfs(nums: nums.sorted())
    return result
}

func dfs(nums: [Int]) {
    if (nums.count == 0) {
        result.append(path)
        return
    }
    for i in 0...nums.count-1 {
        if i > 0 && nums[i] == nums[i - 1] {
            continue
        }
        var nums = nums
        path.append(nums.remove(at: i))
        dfs(nums: nums)
        path.removeLast()
    }
}

var res = permuteUnique([3,3,0,3])
print(res)

