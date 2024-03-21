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
        new_node.next = self.head
        self.head = new_node
        if self._size == 0:
            self.tail = new_node
        self._size += 1

    def insert_at_position(self, value, position):
        if position < 0 or position > self._size:
            return "Position out of bounds"
        if position == 0:
            self.prepend(value)
            return
        if position == self._size:
            self.append(value)
            return
        new_node = Node(value)
        temp = self.head
        for _ in range(position - 1):
            temp = temp.next
        new_node.next = temp.next
        temp.next = new_node
        self._size += 1

    def delete_first_node(self):
        if not self.head:
            return "List is empty"
        self.head = self.head.next
        if self._size == 1:
            self.tail = None
        self._size -= 1

    def delete_last_node(self):
        if not self.head:
            return "List is empty"
        if self._size == 1:
            self.head = None
            self.tail = None
        else:
            temp = self.head
            while temp.next != self.tail:
                temp = temp.next
            temp.next = None
            self.tail = temp
        self._size -= 1

    def delete_at_position(self, position):
        if position < 0 or position >= self._size:
            return "Position out of bounds"
        if position == 0:
            self.delete_first_node()
            return
        temp = self.head
        for _ in range(position - 1):
            temp = temp.next
        temp.next = temp.next.next
        if position == self._size - 1:
            self.tail = temp
        self._size -= 1

    def size(self):
        return self._size

    def print_list(self):
        current = self.head
        while current:
            print(current.value, end=" -> " if current.next else "")
            current = current.next
        print()

    def split_list(self):
        if not self.head or not self.head.next:
            return self.head, None
        slow = self.head
        fast = self.head.next
        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next
        front = self.head
        back = slow.next
        slow.next = None
        return front, back

    def merge_sorted_lists(self, l1, l2):
        dummy = Node(0)
        tail = dummy
        while l1 and l2:
            if l1.value < l2.value:
                tail.next, l1 = l1, l1.next
            else:
                tail.next, l2 = l2, l2.next
            tail = tail.next
        tail.next = l1 or l2
        return dummy.next

    @staticmethod
    def merge_sort_list(head):
        if not head or not head.next:
            return head
        middle = LinkedList.get_middle(head)
        next_to_middle = middle.next
        middle.next = None
        left = LinkedList.merge_sort_list(head)
        right = LinkedList.merge_sort_list(next_to_middle)
        sorted_list = LinkedList().merge_sorted_lists(left, right)
        return sorted_list

    @staticmethod
    def get_middle(head):
        if not head:
            return head
        slow = head
        fast = head
        while fast.next and fast.next.next:
            slow = slow.next
            fast = fast.next.next
        return slow

    def sort(self):
        self.head = LinkedList.merge_sort_list(self.head)


# Helper functions to convert between linked lists and Python lists for demonstration
def list_to_linked_list(elements):
    ll = LinkedList()
    for element in elements:
        ll.append(element)
    return ll


def linked_list_to_list(node):
    result = []
    while node:
        result.append(node.value)
        node = node.next
    return result
