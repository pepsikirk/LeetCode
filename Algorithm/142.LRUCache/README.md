# 题目

## [146. LRU缓存机制](https://leetcode-cn.com/problems/lru-cache/)

运用你所掌握的数据结构，设计和实现一个 [LRU (最近最少使用) 缓存机制](https://baike.baidu.com/item/LRU)。它应该支持以下操作： 获取数据 `get` 和 写入数据 `put` 。

获取数据 `get(key)` - 如果密钥 (key) 存在于缓存中，则获取密钥的值（总是正数），否则返回 -1。
写入数据 `put(key, value)` - 如果密钥不存在，则写入其数据值。当缓存容量达到上限时，它应该在写入新数据之前删除最近最少使用的数据值，从而为新的数据值留出空间。

**进阶:**

你是否可以在 **O(1)** 时间复杂度内完成这两种操作？

**示例:**

```
LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );

cache.put(1, 1);
cache.put(2, 2);
cache.get(1);       // 返回  1
cache.put(3, 3);    // 该操作会使得密钥 2 作废
cache.get(2);       // 返回 -1 (未找到)
cache.put(4, 4);    // 该操作会使得密钥 1 作废
cache.get(1);       // 返回 -1 (未找到)
cache.get(3);       // 返回  3
cache.get(4);       // 返回  4
```

# 思路

这道题我首先使用字典和数组实现了一次，代码如下。

    class LRUCache {
        
        let capacity: Int
        
        var dict = [Int: Int]()
        var array = [[Int: Int]]()
        
        init(_ capacity: Int) {
            self.capacity = capacity
        }
        
        func get(_ key: Int) -> Int {
            let value = dict[key] ?? -1
            if let index = array.firstIndex(of: [key:value]) {
                array.remove(at: index)
                array.append([key:value])
            }
            return value
        }
        
        func put(_ key: Int, _ value: Int) {
            if let value = dict[key] {
                dict.removeValue(forKey: key)
                if let index = array.firstIndex(of: [key:value]) {
                    array.remove(at: index)
                }
            }
            array.append([key:value])
            dict[key] = value
    
            while array.count > capacity {
                let d = array.removeFirst()
                dict.removeValue(forKey: (d.first?.key)!)
            }
        }
    }
提交后超出时间限制。我估计是因为数组的 firstIndex 方法并不难达到 O(1) 的时间复杂度。

那么就只能用这道题的标准解法，双链表了。

在之前我也并没有用过双链表，只能参考别人代码复写来帮助理解，实际上对双链表的理解还不太够。

```
class DLinkedNode: NSObject {
    
    let key: Int
    var value: Int
    var prev: DLinkedNode?
    var next: DLinkedNode?
    
    init(_ key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}

class LRUCache {

    var capacity: Int

    var head = DLinkedNode(0, value: 0)
    var tail = DLinkedNode(0, value: 0)
    var dict = [Int: DLinkedNode]()
    
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            deleteNode(node)
            insertHead(node)
            return node.value
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            node.value = value
            deleteNode(node)
            insertHead(node)
        } else {
            if dict.count >= capacity {
                if let node = tail.prev {
                    node.prev?.next = tail
                    tail.prev = node.prev
                    dict.removeValue(forKey: node.key)
                }
            }
            let node = DLinkedNode(key, value: value)
            insertHead(node)
            dict[key] = node
        }
    }
    
    func insertHead(_ node: DLinkedNode) {
        let next = head.next
        next?.prev = node
        head.next = node
        node.prev = head
        node.next = next
    }
    
    func deleteNode(_ node: DLinkedNode) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
        node.prev = nil
        node.next = nil
    }
}
```

提交后通过，耗时 464 ms ，战胜了 89.58 % 的 Swift 提交记录。

### 最后完成的代码[链接](https://github.com/pepsikirk/LeetCode/blob/master/Algorithm/142.LRUCache/code.swift)




