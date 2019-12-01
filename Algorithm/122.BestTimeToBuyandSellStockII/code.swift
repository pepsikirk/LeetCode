
import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    if prices.count == 0 {
        return 0
    }
    var res = 0
    var prePrice = prices[0]
    
    for price in prices {
        let different = price - prePrice
        if different > 0 {
            res += different
        }
        prePrice = price
    }
    
    return res
}

var res = maxProfit([7,1,5,3,6,4])
print(res)
