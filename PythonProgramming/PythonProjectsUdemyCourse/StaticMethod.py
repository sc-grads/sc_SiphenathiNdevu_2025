class Calculator:
    def __init__(self, version: int) -> None:
        self.version = version

    @staticmethod
    def add(*numbers: float) -> float:
        return sum(numbers)

    def get_version(self) -> int:
        return self.version


def main() -> None:
    calc = Calculator(version=1)
    result = calc.add(1, 2, 3, 4)
    print(f"Sum: {result}")            # Sum: 10

    # get_version must be called on the instance
    print(f"Version: {calc.get_version()}")  # Version: 1


if __name__ == "__main__":
    main()
