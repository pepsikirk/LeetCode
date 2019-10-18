# 题目

1.两数相加

给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

示例:
```
输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
输出：7 -> 0 -> 8
原因：342 + 465 = 807
```

# 思路

首先想到需要对链表进行循环取值，如何循环呢，for-in 是不行了，那么就想到用while 来循环。
由于是需要取2个链表的值，循环条件就需要是2个同时来判断。然后每次取子链表判断，最后代码如下

代码:

```
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var returnLn: ListNode?
    
    var ln1 = l1
    var ln2 = l2
    var addNum = 0
    
    var ln: ListNode?
    
    while ln1 != nil || ln2 != nil {
        let tuple = listNode(ln1, ln2, addNum)
        addNum = tuple.0
        if returnLn == nil {
            ln = tuple.1
            returnLn = ln
        } else {
            ln!.next = tuple.1
            ln = ln!.next
        }
        
        ln1 = ln1?.next
        ln2 = ln2?.next
    }
    
    return returnLn
}

func listNode(_ l1: ListNode?, _ l2: ListNode?, _ addNum: Int) -> (Int, ListNode) {
    let l1Val = l1?.val ?? 0
    let l2Val = l2?.val ?? 0
    let num = addNumber(l1Val, l2Val, addNum)
    let ln = ListNode.init(num.1)
    return (num.0, ln)
}

func addNumber(_ num1: Int, _ num2: Int, _ num3: Int) -> (Int, Int) {
    let num = num1 + num2 + num3
    if num >= 10 {
        return (1, num - 10)
    } else {
        return (0, num)
    }
}
```

结果是有一个用例错了，链表是 5 和 5 的时候输出了 0 ，而不是 0 -> 1
所以需要在循环结束后加上2个都为空的判断。加上下面代码后，通过，用时 60 ms，战胜 92.46 % swift 提交记录

代码:

```
if ln1 == nil && ln2 == nil && addNum > 0 {
    ln!.next = ListNode.init(addNum)
}
```

最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/2.AddTwoNumbers/AddTwoNumbers.swift)




