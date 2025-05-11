class Car:
    __YEAR: int = 200

    def __init__(self, brand: str, fuel_type: str) -> None:
        # “Private” attributes (name‑mangled)
        self.__brand = brand
        self.__fuel_type = fuel_type
        # Public attribute
        self.var: str = "red"

    def drive(self) -> None:
        print(f"Driving: {self.__brand}")

    # Private helper
    def __get_description(self) -> None:
        print(f"{self.__brand}: {self.__fuel_type}")

    # Public wrapper so outside code can describe the car
    def describe(self) -> None:
        self.__get_description()

    def display_colour(self) -> None:
        print(f"{self.__brand} is \"{self.var.capitalize()}\"")


def main() -> None:
    # Correct instantiation syntax:
    car = Car("Toyota", "Electric")

    # Use the public methods:
    car.drive()            # Driving: Toyota
    car.display_colour()   # Toyota is "Red"
    car.describe()         # Toyota: Electric


if __name__ == "__main__":
    main()
