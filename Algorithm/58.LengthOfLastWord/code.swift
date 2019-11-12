
import Foundation

func lengthOfLastWord(_ s: String) -> Int {
    let array = Array(s)
    var i = array.count - 1
    var length = 0
    while i >= 0 {
        let last = array[i]
        if last.isWhitespace {
            if length > 0 {
                return length
            }
        } else {
            length += 1
        }
        i -= 1
    }
    return length
}

let res = lengthOfLastWord("a ")

print(res)
