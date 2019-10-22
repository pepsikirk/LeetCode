# 题目

## [206.反转链表](https://leetcode-cn.com/problems/reverse-linked-list/)

反转一个单链表。

**示例:**

```
输入: 1->2->3->4->5->NULL
输出: 5->4->3->2->1->NULL
```

**进阶:**
你可以迭代或递归地反转链表。你能否用两种方法解决这道题？

# 思路

上来还是用能想到最简单的方法。

先遍历链表，然后把链表的元素缓存起来，然后倒着遍历数组，重新创建一个新的链表

代码如下:

```
func reverseList(_ head: ListNode?) -> ListNode? {
    var array = [Int]()

    var ln = head
    while ln != nil {
        array.append(ln!.val)
        ln = ln?.next
    }
    let rln = ListNode(0)
    ln = rln
    while array.count > 0 {
        let num = array.last!
        ln?.next = ListNode(num)
        ln = ln?.next
        array.removeLast()
    }

    return rln.next
}
```

运行结果居然是通过了，O(n²)的时间复杂度，用时24ms，战胜69.34% Swift 提交。可能是因为用例数量太少，并且数据量也不大的原因。下面当然是要继续优化代码，看看能不能降低时间复杂度。

首先还是要遍历链表，每次取出链表第一个元素，然后把之前创建的链表赋值给赋值给当前元素的 next ，然后再更新需要遍历的数据，就可以了，详细的可以看代码注释，就比较清楚了。

代码如下:

```
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var rln: ListNode?
        var ln = head

        while ln != nil {
        		//ln = 12345  2345  345 ...
        		//先取出以后需要遍历的数据
        		//next = 2345  345  45 ...
            let next = ln!.next
            //将之前创建的链表赋值给当前值的next
            //ln = 1  21  321 ...
            ln!.next = rln
            //1  21  321 ...
            //更新新的遍历数据
            rln = ln!
            //2345  345  45 ...
            ln = next
        }

        return rln
    }
}
```

这次的时间复杂度为 O(n) ，耗时 16ms ，战胜了 99.27% 的 Swift 提交。

下面继续题目进阶说的，使用递归来做这道题。

递归的话，首先就要不断递归获取到最后的值，然后再返回值时处理数据，让返回的链表的 next 为当前 head 的值即可。注意的是需要 `head!.next = nil` 切断引用循环。

    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let next = head?.next else {
            return head
        }
        let ln = reverseList(next)
        //因为class引用所以直接操作next即可
        next.next = head
        //切断引用循环
        head!.next = nil
    
        return ln
    }
递归的时间复杂度也是 O(n) ，实际比循环还快，耗时 12ms ，战胜了 100% 的 Swift 提交。估计也是因为用例比较少，正常的时间波动。



### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/206.ReverseLinkedList/ReverseLinkedList.swift)




