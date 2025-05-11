import time
from functools import cached_property

class DataSet:
    def __init__(self, data: list[float]) -> None:
        self._data = data

    def show_data(self) -> None:
        print(self._data)

    @cached_property
    def sum(self) -> float:
        print("Calculating sum...")
        time.sleep(2)
        return sum(self._data)

    @cached_property
    def mean(self) -> float:
        print("Calculating mean...")
        time.sleep(2)
        return sum(self._data) / len(self._data)

if __name__ == "__main__":
    ds = DataSet([1.5, 2.5, 10, 7])
    ds.show_data()

    while True:
        user_input: str = input(">> ").lower()

        if user_input == "sum":
            print(f"Sum: {ds.sum}")

        elif user_input == "mean":
            print(f"Mean: {ds.mean}")

        elif user_input == "clear sum":
            try:
                del ds.sum
                print("Sum cache cleared.")
            except AttributeError:
                print("Sum was not cached yet.")

        elif user_input == "clear mean":
            try:
                del ds.mean
                print("Mean cache cleared.")
            except AttributeError:
                print("Mean was not cached yet.")

        else:
            print("Unknown command.")
