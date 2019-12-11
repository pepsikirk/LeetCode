
import Foundation

func rotate(_ matrix: inout [[Int]]) {
    let count = matrix.count
    for i in 0..<count {
        for j in i+1..<count {
            let temp = matrix[i][j]
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = temp
        }
    }
    for i in 0..<count {
        var left = 0
        var right = count - 1
        while left < right {
            let temp = matrix[i][left]
            matrix[i][left] = matrix[i][right]
            matrix[i][right] = temp
            left += 1
            right -= 1
        }
    }
}

var matrix =
    [
        [1,2,3],
        [4,5,6],
        [7,8,9]
]
rotate(&matrix)
print(matrix)

