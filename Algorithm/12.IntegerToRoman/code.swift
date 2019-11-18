
import Foundation

func intToRoman(_ num: Int) -> String {
    let romans = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    let numbers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    var res = ""
    var num = num
    for i in 0..<13 {
        let subNumber = numbers[i]
        if num < subNumber {
            continue
        }
        for _ in 0..<num/subNumber {
            res.append("\(romans[i])")
        }
        num = num % subNumber
    }
    return res
}

let res = intToRoman(3999)

print(res)
