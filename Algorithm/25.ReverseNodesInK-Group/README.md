# 题目

## [25. K 个一组翻转链表](https://leetcode-cn.com/problems/reverse-nodes-in-k-group/)

给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。

k 是一个正整数，它的值小于或等于链表的长度。

如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

**示例 :**

给定这个链表：`1->2->3->4->5`

当 k = 2 时，应当返回: `2->1->4->3->5`

当 k = 3 时，应当返回: `3->2->1->4->5`

**说明 :**

- 你的算法只能使用常数的额外空间。
- **你不能只是单纯的改变节点内部的值**，而是需要实际的进行节点交换。

# 思路

会用到反转链表的代码，于是使用了之前206题反转链表的代码。

我想到的就是可以将链表不断遍历，遍历到每 k 个节点，然后反转之前记录好的链表的节点，然后再对这个新链表前后节点进行连接即可，详细内容可以看代码注释。

下面就是代码：

```
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
```

提交后成功。用时 44 ms ，战胜了 95.83 % 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/25.ReverseNodesInK-Group/code.swift)




