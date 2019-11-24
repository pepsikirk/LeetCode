
import Foundation

func divide(_ dividend: Int, _ divisor: Int) -> Int {
    if dividend == Int32.min && divisor == -1 {
        return Int(Int32.max)
    }
    let sign = (divisor > 0 && dividend > 0) || (divisor < 0 && dividend < 0)
    var res = 0
    var dividend = abs(dividend)
    let divisor = abs(divisor)
    var count = 1
    var temp = divisor
    while dividend >= divisor {
        while dividend >= temp {
            dividend -= temp
            res += count
            count <<= 1
            temp <<= 1
        }
        count >>= 1
        temp >>= 1
    }
    return sign ? res : -res
}

var r = divide(-2147483648, 1)
print(r)
