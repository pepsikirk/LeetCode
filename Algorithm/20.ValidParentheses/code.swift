import Foundation

func isValid(_ s: String) -> Bool {
    var array = [Character]()
    for c in s {
        if c == "(" || c == "[" || c == "{" {
            array.append(c)
        } else if c == ")" {
            if array.last == "(" {
                array.removeLast()
            } else {
                return false
            }
        } else if c == "]" {
            if array.last == "[" {
                array.removeLast()
            } else {
                return false
            }
        } else if c == "}" {
            if array.last == "{" {
                array.removeLast()
            } else {
                return false
            }
        }
    }
    return array.count == 0
}

let res = isValid("()")
print(res)
