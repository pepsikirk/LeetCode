# 题目

## [148. 排序链表](https://leetcode-cn.com/problems/sort-list/)

在 *O*(*n* log *n*) 时间复杂度和常数级空间复杂度下，对链表进行排序。

**示例 1:**

```
输入: 4->2->1->3
输出: 1->2->3->4
```

**示例 2:**

```
输入: -1->5->3->4->0
输出: -1->0->3->4->5
```

# 思路

这题直接想到的就是变量链表存入数组，直接调用系统排序方法后，再创建链表解决。

    func sortList(_ head: ListNode?) -> ListNode? {
        var head = head
        var array = [Int]()
        while head != nil {
            array.append(head!.val)
            head = head?.next
        }
        array.sort()
        let res = ListNode(0)
        var ln = res
        for num in array {
            ln.next = ListNode(num)
            ln = ln.next!
        }
        return res.next
    }
提交后通过，耗时 156 ms ，战胜了 100% 的 Swift 提交记录。

但是很明显，不符合题意，题目要求是常数级的空间复杂度，那么就是  O(1) 的空间复杂度。我这里使用了数组来存储，明显不满足。实际上也比这麻烦的多了。

看到要求时间复杂度，明显需要用到排序算法。这里需要使用了迭代的归并排序，因为递归实际上的空间复杂度也不能达到 O(n) 。

先通过遍历获取链表的数量，然后每一轮遍历 cut 2,4,8...的数量的2个链表进行排序。最后就可以得到排序好的链表了。2个链表排序代码沿用第21道题的代码。

最后代码如下：

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
提交后通过，耗时 404 ms ，战胜了 7.50% 的 Swift 提交记录。

至于为什么这么低，是因为大多数人的提交，都没有遵从题目的要求，满足在 O(1) 的空间复杂度的这个条件。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/148.SortList/code.swift)




