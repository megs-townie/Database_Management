# Linked List Implementation in Python

This is a Python implementation of a singly linked list data structure.

## Overview

A linked list is a linear data structure where each element (node) is a separate object. Each node consists of two parts: the data and a reference to the next node. Unlike arrays, linked lists do not have a fixed size, allowing for efficient insertion and deletion operations.

## Features

- **Append**: Add a new node containing a value to the end of the list.
- **Prepend**: Add a new node containing a value to the start of the list.
- **Size**: Return the total number of nodes in the list.
- **Head**: Return the first node in the list.
- **Tail**: Return the last node in the list.
- **At**: Return the node at the given index.
- **Pop**: Remove the last element from the list.
- **Contains**: Check if a value is in the list.
- **Find**: Return the index of the node containing a value.

## Usage

To use the linked list implementation, simply import the `LinkedList` class from `LinkedList.py`:

```python
from LinkedList import LinkedList

# Create a new instance of LinkedList
my_list = LinkedList()

# Append some values to the list
my_list.append(10)
my_list.append(20)
my_list.append(30)

# Print the size of the list
print("Size of the list:", my_list.size())

# Print the first and last elements of the list
print("First element:", my_list.head.value)
print("Last element:", my_list.tail.value)
```

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please [open an issue](link_to_issues) or [submit a pull request](link_to_pull_requests).

## License

This project is licensed under the [MIT License](LICENSE) - see the LICENSE file for details.
