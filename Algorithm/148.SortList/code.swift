
import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func sortList(_ head: ListNode?) -> ListNode? {
    var allCount = 0;
    var node = head;
    
    while node != nil {
        node = node!.next;
        allCount += 1;
    }
    
    let res = ListNode(0);
    res.next = head;
    
    var subCount = 1;
    
    while subCount < allCount {
        var cln = res.next;
        var pln = res;
        while cln != nil {
            let ln1 = cln;
            let ln2 = cut(cln, subCount);
            cln = cut(ln2, subCount);
            pln.next = mergeTwoLists(ln1, ln2);
            
            while pln.next != nil {
                pln = pln.next!;
            }
        }
        subCount *= 2;
    }
    return res.next;
}

func cut(_ head: ListNode?, _ n: Int) -> ListNode? {
    guard var head = head else {
        return nil
    }
    
    var count = 1;
    while count < n {
        if let next = head.next {
            head = next;
            count += 1;
        } else {
            return nil
        }
    }
    let next = head.next;
    head.next = nil;
    return next;
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

var l1 = ListNode.init(-1)
var l2 = ListNode.init(5)
var l3 = ListNode.init(3)
var l4 = ListNode.init(6)
var l5 = ListNode.init(0)
var l6 = ListNode.init(-4)

l5.next = l6
l4.next = l5
l3.next = l4
l2.next = l3
l1.next = l2

let res = sortList(l1)

print(res)
