
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

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    if k == 1 {
        return head
    }
    let res = ListNode(0)
    var head = head
    var temp = res
    var i = 0
    //遍历链表
    while head != nil {
        let next = head?.next
        //取余
        let remainder = i % k
        //余数为0就为当前需要反转的链表的开始
        if remainder == 0 {
            temp.next = head!
        } else if (remainder == k - 1) {
            //余数 k-1 为当前需要反转的链表的结束
            //断开之后的链接
            head?.next = nil
            //记录将会是尾部的指针
            let next = temp.next
            //反转
            temp.next = reverseList(temp.next)!
            //反转后重新记录尾部指针
            temp = next!
        }
        i += 1
        head = next
    }
    return res.next
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

var r = reverseKGroup(l1, 1)
print(r)
