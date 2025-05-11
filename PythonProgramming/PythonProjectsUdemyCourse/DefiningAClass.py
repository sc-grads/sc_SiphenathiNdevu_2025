class Car:
    def __init__(self, brand: str, wheels: int) -> None:
        self.brand = brand       # attribute: brand name
        self.wheels = wheels     # attribute: number of wheels

    def turn_on(self) -> None:
        print(f"Turning on {self.brand}.")

    def drive(self, kilometers: int) -> None:
        print(f"Driving {self.brand} for {kilometers} km.")

    def turn_off(self) -> None:
        print(f"Turning off {self.brand}.")

    def describe(self) -> None:
        print(f"{self.brand} is a car with {self.wheels} wheels.")

if __name__ == "__main__":
    bmw = Car("BMW", 4)
    bmw.turn_on()
    bmw.drive(10)
    bmw.turn_off()
    bmw.describe()

    volvo = Car("Volvo", 6)
    volvo.turn_on()
    volvo.drive(30)
    volvo.turn_off()
    volvo.describe()
