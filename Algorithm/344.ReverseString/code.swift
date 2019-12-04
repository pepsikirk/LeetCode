
import Foundation

func reverseString(_ s: inout [Character]) {
    var left = 0
    var right = s.count - 1
    while left < right {
        let leftNum = s[left]
        s[left] = s[right]
        s[right] = leftNum
        left += 1
        right -= 1
    }
}

var res: [Character] = ["h","e","l","l","o"]
reverseString(&res)
print(res)

