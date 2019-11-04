
import Foundation

func isPowerOfTwo(_ n: Int) -> Bool {
    var x = 1
    while x > 0 {
        if n == x {
            return true
        } else if (x > n) {
            return false
        } else {
            x *= 2
        }
    }
    return false
}

let res = isPowerOfTwo(3)

print(res)
