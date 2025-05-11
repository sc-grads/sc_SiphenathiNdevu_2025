from dataclasses import dataclass

# Using a data class
@dataclass
class Coin:
    name: str
    value: float
    id: str  # you can safely use 'id' here without affecting built-in functions

def main():
    # Creating data class instances
    bitcoin = Coin("Bitcoin", 10000, "BTC")
    bitcoin2 = Coin("Bitcoin", 10000, "BTC")
    ripple = Coin("Ripple", 200, "XRP")

    # Print the data class instances
    print(bitcoin)
    print(ripple)

    # Comparisons
    print("bitcoin == ripple:", bitcoin == ripple)       # False
    print("bitcoin == bitcoin2:", bitcoin == bitcoin2)   # True
    print("bitcoin value == ripple value:", bitcoin.value == ripple.value)  # False

    # Now the regular class version (for comparison)
    class RegularCoin:
        def __init__(self, name: str, value: float, coin_id: str):
            self.name = name
            self.value = value
            self.coin_id = coin_id

    print("\n--- Regular Class Example ---")
    regular_bitcoin = RegularCoin("Bitcoin", 10000, "BTC")
    regular_bitcoin2 = RegularCoin("Bitcoin", 10000, "BTC")

    # Print regular class instances (not very readable)
    print(regular_bitcoin)
    print(regular_bitcoin2)

    # Comparisons (won’t compare by value)
    print("regular_bitcoin == regular_bitcoin2:", regular_bitcoin == regular_bitcoin2)  # False

if __name__ == "__main__":
    main()
