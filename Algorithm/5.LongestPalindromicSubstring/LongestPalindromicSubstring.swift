
import Foundation

func longestPalindrome(_ s: String) -> String {
    if s.count < 1 {
        return s
    }
    let cArray = Array(s)
    
    var res = (0, 0)
    for index in 0...(cArray.count - 1) {
        let res1 = search(cArray: cArray, left: index, right: index)
        let res2 = search(cArray: cArray, left: index, right: index + 1)
        
        res = compare(tuple1: res1, tuple2: res)
        res = compare(tuple1: res2, tuple2: res)
    }
    
    return String(cArray[res.0...res.1])
}

func search(cArray: [Character], left: Int, right: Int) -> (Int, Int) {
    var left = left
    var right = right
    
    var start = 0
    var end = 0
    while left >= 0 && right < cArray.count {
        if cArray[left] != cArray[right] {
            break
        }
        start = left
        end = right
        
        left -= 1
        right += 1
    }
    return (start, end)
}

func compare(tuple1: (Int, Int), tuple2: (Int, Int)) -> (Int, Int) {
    if (tuple1.1 - tuple1.0) > (tuple2.1 - tuple2.0) {
        return tuple1
    } else {
        return tuple2
    }
}

let res = longestPalindrome("babad")

print(res)
