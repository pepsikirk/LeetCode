# 题目

## [21. 合并两个有序链表](https://leetcode-cn.com/problems/merge-two-sorted-lists/)

将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。 

示例：

```
输入：1->2->4, 1->3->4
输出：1->1->2->3->4->4
```

# 思路

还是老办法，通过判断2个链表是否为空来循环链表，不断取2个链表的值对比，然后根据大小赋值，然后继续遍历链表下一个节点。

代码如下:

```
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
```

运行结果用时16ms，战胜 97.12% Swift 提交。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/206.ReverseLinkedList/code.swift)




