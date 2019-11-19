
import Foundation

func letterCombinations(_ digits: String) -> [String] {
    if digits.count == 0 {
        return []
    }
    let digits = Array(digits)
    let dict = ["2": ["a", "b", "c"],
                "3": ["d", "e", "f"],
                "4": ["g", "h", "i"],
                "5": ["j", "k", "l"],
                "6": ["m", "n", "o"],
                "7": ["p", "q", "r", "s"],
                "8": ["t", "u", "v"],
                "9": ["w", "x", "y", "z"]]
    var array = [[String]]()
    for char in digits {
        array.append(dict[String(char)]!)
    }
    var res = array.first!
    for letters in array[1..<array.count] {
        var newRes = [String]()
        for letter in letters {
            for string in res {
                newRes.append(string + letter)
            }
        }
        res = newRes
    }
    return res
}

let res = letterCombinations("234")

print(res)
