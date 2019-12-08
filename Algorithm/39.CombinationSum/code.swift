
import Foundation

var result = [[Int]]()
var temp = [Int]()

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    dfs(candidates: candidates.sorted(), target: target, index: 0)
    return result
}

func dfs(candidates:[Int], target: Int, index: Int) {
    if target == 0 {
        result.append(temp)
        return
    }
    for i in index..<candidates.count {
        let num = candidates[i]
        let difference = target - num
        if difference >= 0 {
            temp.append(num)
            dfs(candidates: candidates, target: difference, index: i)
            temp.removeLast()
        }
    }
}

var res = combinationSum([2,3,5],8)
print(res)

