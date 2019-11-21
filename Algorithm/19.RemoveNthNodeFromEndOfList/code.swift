
import Foundation

public class ListNode: CustomDebugStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public var debugDescription: String {
        var string = ""
        var ln: ListNode? = self
        while ln != nil {
            string += "\(ln!.val)->"
            ln = ln?.next
        }
        return string
    }
}


func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let ln = ListNode(0)
    ln.next = head
    var i = 0
    var ln1: ListNode? = ln
    var ln2: ListNode? = ln
    while ln1?.next != nil {
        if i >= n {
            ln2 = ln2?.next
        }
        ln1 = ln1?.next
        i += 1
    }
    ln2?.next = ln2?.next?.next
    
    return ln.next
}

var l1 = ListNode(0)
var l2 = ListNode(1)
var l3 = ListNode(2)
var l4 = ListNode(3)
var l5 = ListNode(4)
var l6 = ListNode(5)


l5.next = l6
l4.next = l5
l3.next = l4
l2.next = l3
l1.next = l2

let res = removeNthFromEnd(l1, 3)

print(res)
