import Foundation

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkList {
    private var head: Node?
        
    func addFront(_ data: Int) {
        let newNode = Node(data, head)
        head = newNode
    }

    func getFirst() -> Int? {
        if head == nil {
            return nil
        }
        return head!.data
    }

    func addBack(_ data: Int) {
        let newNode = Node(data)
        
        if head == nil {
            head = newNode
            return
        }
        
        var node = head!
        while (node.next != nil) {
            node = node.next!
        }
        node.next = newNode
        newNode.next = nil
    }

    func getLast() -> Int? {
        if head == nil {
            return nil
        }
        var node = head!
        while (node.next != nil) {
            node = node.next!
        }
        return node.data
    }

    func insert(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }
        
        let newNode = Node(data)
        var currentNode = head
        var count = 0
        while count < position - 1 {
            currentNode = currentNode?.next
            count += 1
        }
        newNode.next = currentNode?.next
        currentNode!.next = newNode
    }
    
    func deleteFirst() {
        head = head?.next
    }

    func deleteLast() {
        if head?.next == nil {
            head = nil
            return
        }
        
        var previousNode = head
        var currentNode = previousNode?.next
        while currentNode?.next != nil {
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        previousNode?.next = nil
    }
    
    func delete(at position: Int) {
        if position == 0 {
            deleteFirst()
            return
        }
        var previousNode = head
        var currentNode = previousNode?.next
        var count = 0
        while count < position - 1 {
            previousNode = currentNode
            currentNode = currentNode?.next
            count += 1
        }
        previousNode?.next = currentNode?.next
    }
    
    var isEmpty: Bool {
        head == nil
    }
    
    func clear() {
        head = nil
    }
    
    func printLinkedList() {
        if head == nil {
            print("empty")
            return }
        
        var result = [Int]()
        var node = head
        result.append(node!.data)
        
        while node?.next != nil {
            result.append(node!.next!.data)
            node = node?.next
        }
        
        print(result)
    }
}

let linkedList = LinkList()
linkedList.addFront(3)
linkedList.addFront(2)
linkedList.addFront(1)
linkedList.printLinkedList()

linkedList.getFirst()

linkedList.addBack(4)
linkedList.printLinkedList()

linkedList.addBack(9)
linkedList.printLinkedList()

linkedList.addBack(3)
linkedList.printLinkedList()

linkedList.addBack(7)
linkedList.printLinkedList()

linkedList.getLast()

linkedList.insert(position: 2, data: 5)
linkedList.printLinkedList()

linkedList.deleteFirst()
linkedList.printLinkedList()

linkedList.deleteLast()
linkedList.printLinkedList()

linkedList.delete(at: 3)
linkedList.printLinkedList()

linkedList.isEmpty

linkedList.clear()

linkedList.isEmpty

