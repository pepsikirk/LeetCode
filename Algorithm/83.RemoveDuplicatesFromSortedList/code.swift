
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

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var value = head?.val
    let dump = ListNode(0)
    dump.next = head
    var pre = head
    var head = head?.next
    while head != nil {
        let next = head?.next
        if value == head?.val {
            pre?.next = head?.next
        } else {
            pre = head
            value = head?.val
        }
        head = next
    }
    return dump.next
}

var l1 = ListNode(1)
var l2 = ListNode(1)
var l3 = ListNode(1)

l2.next = l3
l1.next = l2

let res = deleteDuplicates(l1)
print(res)

