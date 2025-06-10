class Node:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next =next

def mergelists(l1, l2):
    dummy = Node()
    current = dummy

    while l1 and l2:
        if l1.val < l2.val:
            current.next = l1
            l1 = l1.next
        else:
            current.next = l2
            l2 = l2.next
        current = current.next
    if l1:
        current.next = l1
    if l2:
        current.next = l2

    return dummy.next

def printList(node):
    while node:
        print(node.val, end="-> " if node.next else "")
        node = node.next
    print()

l1 = Node(1, Node(2, Node(3)))
l2 = Node(1, Node(5, Node(6)))

merge = mergelists(l1, l2)
printList(merge)
