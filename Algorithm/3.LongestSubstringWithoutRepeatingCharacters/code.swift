
import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    let s = Array(s)
    var maxLength = 0
    var left = 0
    var index = 0
    
    while index < s.count {
        var l = left
        while l < index {
            if s[l] == s[index] {
                left = l + 1
                break
            }
            
            l += 1
        }
        
        if index - left + 1 > maxLength {
            maxLength = index - left + 1
        }
        
        index += 1
    }
    
    return maxLength
}

let res = lengthOfLongestSubstring("p123pwwkew")

print(res)
