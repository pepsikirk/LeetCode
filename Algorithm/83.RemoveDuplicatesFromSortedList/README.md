# 题目

## [83. 删除排序链表中的重复元素](https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/)

给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。

**示例 1:**

```
输入: 1->1->2
输出: 1->2
```

**示例 2:**

```
输入: 1->1->2->3->3
输出: 1->2->3
```

# 思路

比较简单的一道题，考验对链表的遍历和指针操作，只需要一个变量记录当前值，判断相同就断链与前面的相连，不同就修改遍历继续遍历即可。

代码如下：

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
    
提交后通过，耗时 32 ms ，战胜了 93.81% 的 Swift 提交记录。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/83.RemoveDuplicatesFromSortedList/code.swift)
