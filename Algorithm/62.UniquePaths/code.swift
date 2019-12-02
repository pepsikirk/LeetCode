
import Foundation

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var result = Array.init(repeating: 1, count: n)
    
    for i in 1..<m {
        for j in 1..<n {
            result[j] += result[j-1]
        }
        print(i)
    }
    
    return result[n-1]
}

var res = uniquePaths(3, 7)
print(res)
