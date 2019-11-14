
import Foundation

func addBinary(_ a: String, _ b: String) -> String {
    var res = ""
    var addNum = 0
    var aChars = Array(a)
    var bChars = Array(b)
    
    while aChars.count > 0 || bChars.count > 0 {
        var aNum = 0, bNum = 0
        if aChars.count > 0 {
            aNum = aChars.removeLast().wholeNumberValue!
        }
        if bChars.count > 0 {
            bNum = bChars.removeLast().wholeNumberValue!
        }
        let num = aNum + bNum + addNum
        addNum = num/2
        res = "\(num % 2)" + res
    }
    if addNum != 0 {
        res = "1" + res
    }
    return res
}

let res = addBinary("101111", "10")

print(res)
