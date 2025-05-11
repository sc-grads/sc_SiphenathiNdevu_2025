def demo_ranges() -> None:
    # 1. Basic range from 0 to 4
    print("range(5):", list(range(5)))  # [0, 1, 2, 3, 4]

    # 2. Range with start and stop
    print("range(1, 6):", list(range(1, 6)))  # [1, 2, 3, 4, 5]

    # 3. Range with step
    print("range(0, 10, 2):", list(range(0, 10, 2)))  # [0, 2, 4, 6, 8]

    # 4. Descending range with negative step
    print("range(5, 0, -1):", list(range(5, 0, -1)))  # [5, 4, 3, 2, 1]

    # 5. Using range in a loop
    print("Looping with range(3):")
    for i in range(3):
        print(f"  Iteration {i}")

if __name__ == "__main__":
    demo_ranges()
