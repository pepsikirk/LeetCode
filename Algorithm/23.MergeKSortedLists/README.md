# 题目

## [23.合并K个排序链表](https://leetcode-cn.com/problems/merge-k-sorted-lists/)

合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。

示例:

```
输入:
[
  1->4->5,
  1->3->4,
  2->6
]
输出: 1->1->2->3->4->4->5->6
```

# 思路

首先还是想到用数组来做(感觉用数组做链表排序都是偷奸耍滑- -)

下面就是代码：

```
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
```

提交后成功。用时 104 ms ，战胜了 89.02 % 的 Swift 代码。

当然还是有真正的排序，实际上合并多个链表就可以分解多次合并2个链表，合并2个链表直接可以用21题的代码。那么只要遍历链表数组即可。

代码如下：

```
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
```

提交后成功。用时 160 ms ，战胜了 21.95 % 的 Swift 代码。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/23.MergeKSortedListsr/code.swift)




