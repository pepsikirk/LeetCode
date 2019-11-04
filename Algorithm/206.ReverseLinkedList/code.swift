import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func reverseList(_ head: ListNode?) -> ListNode? {
    var rln: ListNode?
    var ln = head
    
    while ln != nil {
        let next = ln!.next
        ln!.next = rln
        rln = ln!
        ln = next
    }
    
    return rln
}

func reverseList2(_ head: ListNode?) -> ListNode? {
    guard let next = head?.next else {
        return head
    }
    let ln = reverseList2(next)
    next.next = head
    head!.next = nil
    
    return ln
}

var l1 = ListNode.init(1)
var l2 = ListNode.init(2)
var l3 = ListNode.init(3)
var l4 = ListNode.init(4)
var l5 = ListNode.init(5)

l4.next = l5
l3.next = l4
l2.next = l3
l1.next = l2

let res = reverseList2(l1)

print(res!)
