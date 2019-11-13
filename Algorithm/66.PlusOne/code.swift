
import Foundation

func plusOne(_ digits: [Int]) -> [Int] {
    var digits = digits
    var index = digits.count - 1
    
    while index >= 0 {
        let num = digits[index]
        if num < 9 {
            digits[index] = num + 1
            return digits
        }
        
        digits[index] = 0
        index -= 1
    }
    digits.insert(1, at: 0)
    return digits
}

let res = plusOne([9])

print(res)
