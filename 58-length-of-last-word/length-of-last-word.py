class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        """
        Calculates the length of the last word in a given string.

        Args:
            s (str): The input string consisting of words and spaces.

        Returns:
            int: The length of the last word.
        """
        # Step 1: Split the string into a list of words.
        # s.split() handles multiple spaces and leading/trailing spaces automatically.
        words = s.split()

        # Step 2: Access the last word from the list.
        # The problem guarantees at least one word, so words[-1] is safe.
        last_word = words[-1]

        # Step 3: Return the length of the last word.
        return len(last_word)