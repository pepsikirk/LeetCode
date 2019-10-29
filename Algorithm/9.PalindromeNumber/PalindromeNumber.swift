
import Foundation

func isPalindrome(_ x: Int) -> Bool {
    if x < 0 {
        return false
    }
    var vx = x
    var res = 0
    while vx != 0 {
        let n = vx % 10
        res = res * 10 + n
        vx = vx / 10
    }
    return res == x
}

let res = isPalindrome(0)

print(res)
