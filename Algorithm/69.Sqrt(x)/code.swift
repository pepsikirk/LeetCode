
import Foundation

func mySqrt(_ x: Int) -> Int {
    if x == 0 {
        return 0
    }
    var left = 1
    var right = x/2 + 1
    while right - left > 1 {
        let mid = (left + right)/2
        if mid * mid > x {
            right = mid
        } else {
            left = mid
        }
    }
    return left
}

let res = mySqrt(4)

print(res)
