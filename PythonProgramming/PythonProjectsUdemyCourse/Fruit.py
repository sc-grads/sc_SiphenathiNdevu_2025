class Fruit:
    def __init__(self, name: str, grams: float) -> None:
        self.name = name       # store the name on this instance
        self.grams = grams     # store the weight on this instance

    def eat(self) -> None:
        print(f"Eating {self.grams}g of {self.name}.")
if __name__ == "__main__":
    apple = Fruit("apple", 25.0)
    banana = Fruit("banana", 10.0)

    apple.eat()    # Eating 25.0g of apple.
    banana.eat()   # Eating 10.0g of banana.
