class Node:
    def __init__(self, value):
        self.value = value
        self.next = None

class LinkedList:
    def __init__(self):
        self.head = None
        self.tail = None
        self._size = 0

    def append(self, value):
        new_node = Node(value)
        if not self.head:
            self.head = new_node
            self.tail = new_node
        else:
            self.tail.next = new_node
            self.tail = new_node
        self._size += 1

    def prepend(self, value):
        new_node = Node(value)
        if not self.head:
            self.head = new_node
            self.tail = new_node
        else:
            new_node.next = self.head
            self.head = new_node
        self._size += 1

    def size(self):
        return self._size

    def get_head(self):
        return self.head

    def get_tail(self):
        return self.tail

    def at(self, index):
        if index < 0 or index >= self._size:
            return None
        current = self.head
        for _ in range(index):
            current = current.next
        return current

    def pop(self):
        if not self.head:
            return None
        if self.head == self.tail:
            value = self.head.value
            self.head = None
            self.tail = None
            self._size -= 1
            return value
        current = self.head
        while current.next != self.tail:
            current = current.next
        value = self.tail.value
        current.next = None
        self.tail = current
        self._size -= 1
        return value

    def contains(self, value):
        current = self.head
        while current:
            if current.value == value:
                return True
            current = current.next
        return False

    def find(self, value):
        current = self.head
        index = 0
        while current:
            if current.value == value:
                return index
            current = current.next
            index += 1
        return None
