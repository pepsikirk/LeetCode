
import Foundation

func romanToInt(_ s: String) -> Int {
    let romansDict = ["M":1000, "CM":900, "D":500, "CD":400, "C":100, "XC":90, "L":50, "XL":40, "X":10, "IX":9, "V":5, "IV":4, "I":1]
    var res = 0
    var i = 0
    while i < s.count {
        let one = String(s[s.index(s.startIndex, offsetBy:i)])
        
        if i + 1 < s.count, let num = romansDict[one + String(s[s.index(s.startIndex, offsetBy:i + 1)])] {
            res += num
            i += 2
        } else {
            res += romansDict[one]!
            i += 1
        }
    }
    return res
}

let res = romanToInt("MCMXCIV")

print(res)
