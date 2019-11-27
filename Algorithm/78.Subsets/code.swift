
import Foundation

var result = [[Int]]()
var path = [Int]()

func subsets(_ nums: [Int]) -> [[Int]] {
    dfs(nums: nums, level: 0)
    return result
}

func dfs(nums: [Int], level: Int) {
    if (level >= nums.count) {
        result.append(path)
        return
    }
    
    dfs(nums: nums, level: level + 1)
    path.append(nums[level])
    dfs(nums: nums, level: level + 1)
    
    path.removeLast()
}

var res = subsets([2,1,3])
print(res)
