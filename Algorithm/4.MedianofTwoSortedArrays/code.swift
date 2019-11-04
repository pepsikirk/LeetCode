
import Foundation

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let nums = nums1 + nums2
    if nums.count == 1 {
        return Double(nums.first!)
    }
    var nums1 = nums1
    var nums2 = nums2
    
    var mid = nums.count/2
    var array = [Int]()
    while mid >= 0 {
        if nums1.count == 0 {
            array.append(nums2[0])
            nums2.remove(at: 0)
        } else if (nums2.count == 0 ) {
            array.append(nums1[0])
            nums1.remove(at: 0)
        } else {
            let num1 = nums1[0]
            let num2 = nums2[0]
            if num1 < num2 {
                array.append(nums1[0])
                nums1.remove(at: 0)
            } else {
                array.append(nums2[0])
                nums2.remove(at: 0)
            }
        }
        mid -= 1
    }
    if nums.count%2 == 0 {
        return Double(array.last! + array[array.count - 2])/2
    } else {
        return Double(array.last!)
    }
}

let res = findMedianSortedArrays([1,2] , [3,4])

print(res)

