
import Foundation

func climbStairs(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    var value1 = 0
    var value2 = 1
    var result = value1 + value2
    for _ in 1..<n {
        value1 = value2
        value2 = result
        result = value1 + value2
    }
    return result
}

var res = climbStairs(2)
print(res)
