from LinkedList import LinkedList

# Example usage demonstrating all functionalities
if __name__ == "__main__":
    # Create a new LinkedList instance
    ll = LinkedList()
    print("After appending 10, 20, 30:")
    ll.append(10)
    ll.append(20)
    ll.append(30)
    ll.print_list()

    print("Size of the list:", ll.size())

    # Demonstrating insertion at the beginning
    print("\nAfter prepending 5:")
    ll.prepend(5)
    ll.print_list()

    # Demonstrating insertion at a given position
    print("\nAfter inserting 15 at position 2:")
    ll.insert_at_position(15, 2)
    ll.print_list()

    # Demonstrating deletion of the first node
    print("\nAfter deleting the first node:")
    ll.delete_first_node()
    ll.print_list()

    # Demonstrating deletion of the last node
    print("\nAfter deleting the last node:")
    ll.delete_last_node()
    ll.print_list()

    # Demonstrating deletion at a given position
    print("\nAfter deleting node at position 1:")
    ll.delete_at_position(1)
    ll.print_list()

    # Splitting the list
    front, back = ll.split_list()
    front_list = LinkedList()
    front_list.head = front
    back_list = LinkedList()
    back_list.head = back

    print("\nFront half of the list:")
    front_list.print_list()

    print("Back half of the list:")
    back_list.print_list()

    # Merging two sorted lists
    list_a = list_to_linked_list([1, 3, 5])
    list_b = list_to_linked_list([2, 4, 6])
    merged_list = LinkedList()
    merged_list.head = merged_list.merge_sorted_lists(list_a.head, list_b.head)
    print("\nMerged sorted lists:")
    merged_list.print_list()

    # Sorting the list
    unsorted_list = list_to_linked_list([3, 1, 4, 1, 5, 9, 2, 6])
    unsorted_list.sort()
    print("\nSorted list:")
    unsorted_list.print_list()