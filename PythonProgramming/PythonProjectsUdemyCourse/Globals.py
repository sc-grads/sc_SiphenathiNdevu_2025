# Demonstrating globals() vs. locals()

from typing import Any

# A global variable
example: str = "Bob"

def add(a: int, b: int) -> None:
    result: int = a + b

    # Show locals inside this function
    print("add() has these locals:")
    for name, value in locals().items():
        print(f"  {name} = {value}")

    # Show globals accessible inside this function
    print("\nadd() can see these globals:")
    for name in globals().keys():
        print(f"  {name}")

    # Use both local and global variables
    print(f"\nComputation result: {result}")
    print(f"Global example: {example}\n")


def main() -> None:
    add(1, 1)


if __name__ == "__main__":
    main()
