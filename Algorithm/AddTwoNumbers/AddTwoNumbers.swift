


import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var returnLn: ListNode?
    
    var ln1 = l1
    var ln2 = l2
    var addNum = 0
    
    var ln: ListNode?
    
    while ln1 != nil || ln2 != nil {
        let tuple = listNode(ln1, ln2, addNum)
        addNum = tuple.0
        if returnLn == nil {
            ln = tuple.1
            returnLn = ln
        } else {
            ln!.next = tuple.1
            ln = ln!.next
        }
        
        ln1 = ln1?.next
        ln2 = ln2?.next
        
        if ln1 == nil && ln2 == nil && addNum > 0 {
            ln!.next = ListNode.init(addNum)
        }
    }
    
    return returnLn
}

func listNode(_ l1: ListNode?, _ l2: ListNode?, _ addNum: Int) -> (Int, ListNode) {
    let l1Val = l1?.val ?? 0
    let l2Val = l2?.val ?? 0
    let num = addNumber(l1Val, l2Val, addNum)
    let ln = ListNode.init(num.1)
    return (num.0, ln)
}

func addNumber(_ num1: Int, _ num2: Int, _ num3: Int) -> (Int, Int) {
    let num = num1 + num2 + num3
    if num >= 10 {
        return (1, num - 10)
    } else {
        return (0, num)
    }
}


var l1 = ListNode.init(3)
var l11 = ListNode.init(4)
var l12 = ListNode.init(2)
l11.next = l12
l1.next = l11

var l2 = ListNode.init(4)
var l21 = ListNode.init(6)
var l22 = ListNode.init(5)
l21.next = l22
l2.next = l21

var l = addTwoNumbers(l1, l2)
print(l)

l1 = ListNode.init(5)
l2 = ListNode.init(5)
l = addTwoNumbers(l1, l2)
print(l)
    
