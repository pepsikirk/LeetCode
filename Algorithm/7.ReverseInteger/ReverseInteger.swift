
import Foundation

func reverse(_ x: Int) -> Int {
    var x = x
    var res = 0
    while x != 0 {
        let n = x % 10
        res = res * 10 + n
        x = x / 10
    }
    if res > Int32.max || res < Int32.min {
        return 0
    }
    return res
}

let res = reverse(1534236469)

print(res)
