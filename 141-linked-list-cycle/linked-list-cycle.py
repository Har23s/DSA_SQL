# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

from typing import Optional

class Solution:
    def hasCycle(self, head: Optional[ListNode]) -> bool:
        if not head or not head.next:
            return False

        slow = head
        fast = head

        # Loop until fast or fast.next becomes None (indicating no cycle)
        while fast and fast.next:
            slow = slow.next         # Slow pointer moves one step
            fast = fast.next.next    # Fast pointer moves two steps

            # If slow and fast pointers meet, there is a cycle
            if slow == fast:
                return True

        # If the loop finishes, it means fast reached the end, so no cycle
        return False
        