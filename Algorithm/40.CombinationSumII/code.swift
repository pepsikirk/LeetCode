
import Foundation

var result = [[Int]]()
var temp = [Int]()

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
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
        if i > 0 && num == candidates[i - 1] && i != index {
            continue
        }
        let difference = target - num
        if difference >= 0 {
            temp.append(num)
            dfs(candidates: candidates, target: difference, index: i + 1)
            temp.removeLast()
        }
    }
}

var res = combinationSum2([1,1,2,5,6,7],8)
print(res)

