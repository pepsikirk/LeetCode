
import Foundation

var result = [[Int]]()
var path = [Int]()

func permute(_ nums: [Int]) -> [[Int]] {
    dfs(nums: nums)
    return result
}

func dfs(nums: [Int]) {
    if (nums.count == 0) {
        result.append(path)
        return
    }
    for i in 0...nums.count - 1 {
        var nums = nums
        path.append(nums.remove(at: i))
        dfs(nums: nums)
        path.removeLast()
    }
}

var res = permute([1,2,3])
print(res)

//            1                 2               3
//            2 3               1 3             1 2
//            3 2               3 2             2 1
