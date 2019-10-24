# 题目

## [合并K个排序链表](https://leetcode-cn.com/problems/merge-k-sorted-lists/)

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

首先想到一个方法：

直接遍历数组，取到每一个链表第一个元素，然后对比找到最小的一个元素，把这个元素赋值给记录链表，然后将这个链表直接重置为这个元素的 next ，继续不断循环，直到数组为空。

代码如下:

```Swift
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    if lists.count == 0 {
        return nil
    }
    let rln = ListNode(0)

    var lists = lists.filter{ $0 != nil}
    var ln = rln
    while lists.count > 0 {
        var minLn = lists.first!
        var index = 0
        for (i, list) in lists.dropFirst().enumerated() {
            if list!.val < minLn!.val {
                minLn = list
                index = i + 1
            }
        }
        lists.remove(at: index)
        if let next = minLn!.next {
            lists.append(next)
        }
        minLn!.next = nil
        ln.next = minLn
        ln = ln.next!
    }

    return rln.next
}
```

提交后失败，原因是超出时间限制，那么我们来看看这个代码的时间复杂度。k个链表的数组，总链表数为n，那么时间复杂度应该是 O(kn)，算是比较高的。那么看看怎么优化。

想到既然是需要排序，那么可以借助于数组，可以先遍历所有链表，讲链表的数字插入数组，然后排序数组，最后再遍历数组，就可以创建出一个有序的数组了。

最后代码如下：

```Swift
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

提交后用时 104 ms ，战胜了 90.70 % 的 Swift 代码。

实际上这个方法我觉得应该算是有点作弊的性质了~因为用到了数组的排序，是 Swift 的框架自带的。时间复杂度为 O(n + 框架排序时间复杂度)。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/23.MergeKSortedLists/MergeKSortedLists.swift)




