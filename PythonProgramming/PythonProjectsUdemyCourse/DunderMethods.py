class Book:
    def __init__(self, title: str, pages: int) -> None:
        self.title = title
        self.pages = pages

    def __len__(self) -> int:
        return self.pages

    def __add__(self, other: "Book") -> "Book":
        combined_title = f"{self.title} & {other.title}"
        combined_pages = self.pages + other.pages
        return Book(combined_title, combined_pages)


if __name__ == "__main__":
    b1 = Book("Pi Daily", 100)
    b2 = Book("Harry Potter", 340)

    print(len(b1))          # 100
    print(len(b2))          # 340

    combined = b1 + b2
    print(combined.title)   # Pi Daily & Harry Potter
    print(len(combined))    # 440
