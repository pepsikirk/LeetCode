
import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    var maxResult = 0
    var minValue = Int.max
    
    for price in prices {
        minValue = min(minValue, price)
        maxResult = max(maxResult, price - minValue)
    }
    
    return maxResult
}

var res = maxProfit([7,1,5,3,6,4])
print(res)
