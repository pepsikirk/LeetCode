
import Foundation

var res = [String]()

func generateParenthesis(_ n: Int) -> [String] {
    dfs(string: "", left: n, right: n)
    return res
}

func dfs(string: String, left: Int, right: Int) {
    if right == 0 {
        res.append(string)
        return
    }
    if right > left {
        dfs(string: string + ")", left: left, right: right - 1)
    }
    if left > 0 {
        dfs(string: string + "(", left: left - 1, right: right)
    }
}

var r = generateParenthesis(4)
print(r)
