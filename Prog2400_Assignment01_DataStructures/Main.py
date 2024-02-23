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
