
import Foundation

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    if m == 0 {
        nums1 = nums2
        return
    }
    nums1 = Array(nums1[0..<m])
    var index = 0
    let last = nums1.last
    for i in 0..<nums2.count {
        let num = nums2[i]
        if num > last! {
            nums1.append(num)
            continue
        }
        while index < nums1.count-1 && nums1[index] < num {
            index += 1
        }
        nums1.insert(num, at: index)
    }
}

var array5 = [-12,1,2,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

merge(&array5,5,[-49,-45,-42,-41,-40,-39,-39,-39,-38,-36,-34,-34,-33,-33,-32,-31,-29,-28,-26,-26,-24,-21,-20,-20,-18,-16,-16,-14,-11,-7,-6,-5,-4,-4,-3,-3,-2,-2,-1,0,0,0,2,2,6,7,7,8,10,10,13,13,15,15,16,17,17,19,19,20,20,20,21,21,22,22,24,24,25,26,27,29,30,30,30,35,36,36,36,37,39,40,41,42,45,46,46,46,47,48],90)
print(array5)


var array4 = [0,0,0,0,0]

merge(&array4,0,[1,2,3,4,5],5)
print(array4)

var array2 = [1,2,3,0,0,0]

merge(&array2,3,[2,5,6],3)
print(array2)

var array1 = [2,0]

merge(&array1,1,[1],1)
print(array1)

var array3 = [0]

merge(&array3,0,[1],1)
print(array3)

