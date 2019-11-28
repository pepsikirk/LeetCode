
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
//使用迭代
func subsets2(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    for num in nums {
        let path = [num]
        for r in result {
            var r = r
            r.append(num)
            result.append(r)
        }
        result.append(path)
    }
    result.append([])
    return result
}

var res = subsets([2,1,3])
print(res)
