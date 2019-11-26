
import Foundation

func calculate(_ s: String) -> Int {
    var array = [Int]()
    var result = 0
    var num = 0
    var sign = 1
    for c in s {
        switch c {
        case "+", "-":
            result += num * sign
            sign = c == "+" ? 1 : -1
            if (array.last != nil) {
                sign *= array.last!
            }
            num = 0;
        case "(":
            array.append(sign)
        case ")":
            array.removeLast()
        case " ":
            break
        default:
            num = num * 10 + c.wholeNumberValue!;
        }
    }
    result += num * sign
    return result
}

var res = calculate("1-(2+3-(4+(5-(1-(2+4-(5+6))))))")
print(res)
res = calculate("(5-(1+(5)))")
print(res)
res = calculate("2-(5-6)")
print(res)
res = calculate("2147483647")
print(res)
