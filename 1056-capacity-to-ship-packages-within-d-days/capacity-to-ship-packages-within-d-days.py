from typing import List

class Solution:
    def shipWithinDays(self, weights: List[int], days: int):

        def can_ship(capacity):
            days_needed = 1
            current_weight = 0

            for w in weights:
                if current_weight + w > capacity:
                    days_needed += 1
                    current_weight = w
                else:
                    current_weight += w

            return days_needed <= days

        left = max(weights)
        right = sum(weights)
        answer = right

        while left <= right:
            mid = left + (right - left) // 2

            if can_ship(mid):
                answer = mid
                right = mid - 1
            else:
                left = mid + 1

        return answer
