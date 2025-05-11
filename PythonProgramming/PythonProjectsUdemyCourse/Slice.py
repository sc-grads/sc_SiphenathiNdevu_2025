# Define a reusable slice object that reverses an entire sequence
reverse_slice: slice = slice(None, None, -1)

# Apply it to multiple strings (or any sliceable iterable)
text: str = "Hello, world!"
print(text[reverse_slice])           # Output: "!dlrow ,olleH"

second_text: str = "Python slicing"
print(second_text[reverse_slice])    # Output: "gnicils nohtyP"
