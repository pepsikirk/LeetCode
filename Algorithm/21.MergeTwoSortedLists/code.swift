import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let rln = ListNode(0)
    
    var l1 = l1
    var l2 = l2
    var ln = rln
    while l2 != nil || l1 != nil {
        if l1 == nil {
            ln.next = l2
            l2 = l2?.next
        } else if l2 == nil {
            ln.next = l1
            l1 = l1?.next
        } else {
            if l1!.val < l2!.val {
                ln.next = l1
                l1 = l1?.next
            } else {
                ln.next = l2
                l2 = l2?.next
            }
        }
        ln = ln.next!
        ln.next = nil
    }
    
    return rln.next
}

var l1 = ListNode.init(1)
var l2 = ListNode.init(2)
var l3 = ListNode.init(4)

var l4 = ListNode.init(1)
var l5 = ListNode.init(3)
var l6 = ListNode.init(4)

l2.next = l3
l1.next = l2

l5.next = l6
l4.next = l5

let res = mergeTwoLists(l1, l4)

print(res!)
