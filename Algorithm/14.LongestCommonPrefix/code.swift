import Foundation

func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.count == 0 {
        return ""
    }
    var commonPrefix = ""
    
    var firstString = strs[0]
    var strings = strs
    strings.removeFirst()
    
    for (i, char) in firstString.enumerated() {
        var prefixString = commonPrefix
        prefixString.append(char)
        
        for string in strings {
            if !string.hasPrefix(prefixString) {
                return commonPrefix
            }
        }
        commonPrefix = prefixString
    }
    
    return commonPrefix
}
    
longestCommonPrefix(["flower","flow","flight"])