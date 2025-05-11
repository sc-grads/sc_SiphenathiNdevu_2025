print("A", 1, True, [ "a", "b" ])
# → A 1 True ['a', 'b']

print("A", "B", "C", sep="-")
# → A-B-C

print("1", "2", "3", sep="")
# → 123

print("Hello", end="!")
print("World")
# → Hello!World

print("Line 1", end="...\n")
print("Line 2")
# → Line 1...
#   Line 2

people = ["Alice", "Bob", "Charlie"]
print(*people)
# → Alice Bob Charlie

print(*people, sep=", ", end=".\n")
# → Alice, Bob, Charlie.

with open("log.txt", "a") as f:
    print("Log entry", file=f)
