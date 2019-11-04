
import Foundation

func myAtoi(_ str: String) -> Int {
    var string = ""
    var sign: Int? = nil
    var hasStarted = false
    for c in str {
        if hasStarted && !c.isNumber {
            break
        }
        if c.isWhitespace {
            continue
        }
        if c == "-" || c == "+" {
            if sign != nil {
                return 0
            }
            sign = c == "-" ? -1 : 1
            hasStarted = true
            continue
        }
        if sign == nil {
            sign = 1
        }
        hasStarted = true
        if !c.isNumber {
            break
        }
        string.append(c)
    }
    
    var res = 0
    for c in string {
        res = res * 10 + c.wholeNumberValue!
        
        let num = res * sign!
        if num > Int32.max {
            return Int(Int32.max)
        } else if num < Int32.min {
            return Int(Int32.min)
        }
    }
    
    return res * (sign ?? 1)
}

let res = myAtoi("-5-")

print(res)
