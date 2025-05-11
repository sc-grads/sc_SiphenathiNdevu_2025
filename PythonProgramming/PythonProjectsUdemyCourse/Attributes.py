class Car:
    SPEED_LIMIT_KM: float = 140

    def __init__(self, brand: str) -> None:
        self.brand = brand

    def drive(self, *, speed: float) -> None:
        if speed > self.SPEED_LIMIT_KM:
            print(f"Limiter activated: Driving at {self.SPEED_LIMIT_KM}km/h")
        else:
            print(f"Driving at {speed}km/h")


def main() -> None:
    toyota: Car = Car("Toyota")
    toyota.drive(speed=200)  # exceeds limit, will trigger the limiter


if __name__ == "__main__":
    main()
