from typing import Generator

# Generator that yields numbers from 1 to 5
def five_numbers() -> Generator[int, None, None]:
    for i in range(1, 6):
        yield i

# Generator for huge data (simulating memory efficiency)
def huge_data() -> Generator[int, None, None]:
    for i in range(1, 100_000_000_000):
        yield i

# Generator that yields vowels
def generate_vowels() -> Generator[str, None, None]:
    vowels = ["a", "e", "i", "o", "u"]
    for vowel in vowels:
        yield vowel

if __name__ == "__main__":
    # Example 1: Using five_numbers generator
    numbers = five_numbers()
    print(next(numbers))
    print(next(numbers))
    print(next(numbers))
    print(list(numbers))  # Remaining elements (4, 5)

    # Example 2: Huge data - print first 200 values without materializing
    data = huge_data()
    for _ in range(200):
        print(next(data))

    # Example 3: Vowel generator
    vowels = generate_vowels()
    print(next(vowels))
    print(next(vowels))
    print(next(vowels))

    # Iterating through remaining vowels
    for vowel in vowels:
        print(vowel)

    # Example 4: Manual yield to demonstrate behavior
    def manual_vowels() -> Generator[str, None, None]:
        yield "a"
        yield "e"
        yield "i"
        yield "o"
        yield "u"

    mv = manual_vowels()
    try:
        print(next(mv))
        print(next(mv))
        print(next(mv))
        print(next(mv))
        print(next(mv))
        print(next(mv))  # This will cause StopIteration
    except StopIteration:
        print("Generator is empty")
