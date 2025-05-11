from typing import override

class Shape:
    def __init__(self, name: str, sides: int) -> None:
        self.name = name
        self.sides = sides

    def describe(self) -> None:
        print(f"{self.name} ({self.sides} sides)")

    def shape_method(self) -> None:
        print(f"{self.name}: shape_method()")


class Square(Shape):
    def __init__(self, size: float) -> None:
        # Call the parent constructor to set name="Square" and sides=4
        super().__init__("Square", 4)
        self.size = size

    @override
    def describe(self) -> None:
        # Extend or modify the base describe behavior
        print(f"{self.name} ({self.sides} sides), size = {self.size}")


def main() -> None:
    square: Square = Square(20)
    square.describe()       # Square (4 sides), size = 20
    square.shape_method()   # Square: shape_method()


if __name__ == "__main__":
    main()
