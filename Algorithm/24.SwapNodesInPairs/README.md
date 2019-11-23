# 题目

## [24. 两两交换链表中的节点](https://leetcode-cn.com/problems/swap-nodes-in-pairs/)

给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。

**你不能只是单纯的改变节点内部的值**，而是需要实际的进行节点交换。

**示例:**

```
给定 1->2->3->4, 你应该返回 2->1->4->3.
```

# 思路

首先可以确定的是肯定需要遍历链表，然后看到是两两交互，那么我们可以想象把一个链表分成多个有2个节点的链表。那么我们每次遍历链表的2个节点，然后把这两个节点的前后链路相互切换即可。

下面就是代码：

```
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
```

提交后成功。用时 4 ms ，战胜了 98.39 % 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/24.SwapNodesInPairs/code.swift)




