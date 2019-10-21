import Foundation

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    var minDifference = Int.max
    var returnSum = Int.max
    //先对数组进行排序
    let nums = nums.sorted()
    for (index1, num1) in nums.enumerated() {
        //与之前的值相同就不处理，继续循环
        if index1 > 1 && num1 == nums[index1 - 1] {
            continue
        }
        var index2 = index1 + 1
        var index3 = nums.count - 1
        //排序后的数组可以根据值大小进行前后逼近，减少了循环次数
        while index2 < index3 {
            let num2 = nums[index2]
            let num3 = nums[index3]
            let sum = num1 + num2 + num3
            
            let difference = sum - target
            //比较三个数之和与目标值的差，等于0可以直接返回，大于0要将值变小，小于0将值变大
            if difference == 0 {
                return target
            } else if (difference > 0) {
                index3 -= 1
            } else {
                index2 += 1
            }
            let absDifference = abs(difference)
            if absDifference < minDifference {
                minDifference = absDifference
                returnSum = sum
            }
        }
    }
    return returnSum
}

let res = threeSumClosest([-1,2,1,-4], 1)

print(res)
