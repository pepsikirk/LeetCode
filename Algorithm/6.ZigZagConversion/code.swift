
import Foundation

func convert(_ s: String, _ numRows: Int) -> String {
    if numRows <= 1 {
        return s
    }
    var arrays = Array<String>()
    for _ in 0...numRows - 1 {
        arrays.append("")
    }
    let loop = 2 * numRows - 2
    for (index, c) in s.enumerated() {
        let d = index % loop
        if d < numRows {
            arrays[d].append(c)
        } else {
            let i = loop % d
            arrays[i].append(c)
        }
    }
    return arrays.reduce("", { $0 + $1 })
}

let res = convert("PAYPALISHIRING", 4)

print(res)
