
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


func swapPairs(_ head: ListNode?) -> ListNode? {
    if head?.next == nil {
        return head
    }
    let res = ListNode(0)
    var temp = res
    var head = head
    while head != nil && head?.next != nil {
        let n = head!.next!.next
        
        temp.next = head!.next
        head!.next!.next = head
        head!.next = n
        
        temp = head!
        head = n
    }
    
    return res.next
}

var l1 = ListNode(1)
var l2 = ListNode(2)
var l3 = ListNode(3)
var l4 = ListNode(4)
var l5 = ListNode(5)
var l6 = ListNode(6)
var l7 = ListNode(7)

l6.next = l7
l5.next = l6
l4.next = l5
l3.next = l4
l2.next = l3
l1.next = l2

var r = swapPairs(l1)
print(r)
