
import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    let lists = lists.filter{ $0 != nil}
    if lists.count == 0 {
        return nil
    } else if lists.count == 1 {
        return lists.first as? ListNode
    }
    var array = [Int]()
    for list in lists {
        var ln = list
        while ln != nil {
            array.append(ln!.val)
            ln = ln!.next
        }
    }
    let rln = ListNode(0)
    var ln = rln
    for num in array.sorted() {
        ln.next = ListNode(num)
        ln = ln.next!
    }
    
    return rln.next
}

var l1 = ListNode(1)
var l2 = ListNode(4)
var l3 = ListNode(5)
var l4 = ListNode(1)
var l5 = ListNode(3)
var l6 = ListNode(4)
var l7 = ListNode(2)
var l8 = ListNode(6)

l7.next = l8

l5.next = l6
l4.next = l5

l2.next = l3
l1.next = l2

let res = mergeKLists([l1, l4, l7])

print(res!)

