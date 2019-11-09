
import Foundation

func strStr(_ haystack: String, _ needle: String) -> Int {
    if haystack.count < needle.count {
        return -1
    }
    if needle.count == 0 {
        return 0
    }
    let hArray = Array(haystack)
    let nArray = Array(needle)
    
    for i in 0...hArray.count - nArray.count {
        if hArray[i] == nArray[0] {
            for j in 0..<nArray.count {
                if hArray[i + j] != nArray[j] {
                    break
                }
                if j + 1 == nArray.count {
                    return i
                }
            }
        }
    }
    
    return -1
}

let res = strStr("hello", "ll")

print(res)
