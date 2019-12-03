
import Foundation

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

let cache = LRUCache( 2 /* 缓存容量 */ );

cache.put(1, 1);
cache.put(2, 2);
cache.get(1);       // 返回  1
cache.put(3, 3);    // 该操作会使得密钥 2 作废
cache.get(2);       // 返回 -1 (未找到)
cache.put(4, 4);    // 该操作会使得密钥 1 作废
cache.get(1);       // 返回 -1 (未找到)
cache.get(3);       // 返回  3
cache.get(4);       // 返回  4

