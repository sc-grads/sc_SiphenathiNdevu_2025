import time
import logging

# Original class definition
class Internet:
    def __init__(self, provider: str) -> None:
        self.provider = provider

    def connect(self) -> None:
        print(f"{self.provider} is connecting...")
        time.sleep(2)
        print(f"{self.provider} says: You are now connected!")

# Monkey patching example
def test_connect(self) -> None:
    print(f"{self.provider} (test) says: You are now connected!")

# Main entry point
if __name__ == "__main__":
    internet = Internet("Verizon")

    # Original behavior
    # internet.connect()

    # Monkey patching the connect method
    Internet.connect = test_connect  # type: ignore

    # Using the patched method
    internet.connect()

    print("\n--- Overriding print function example ---\n")

    # Monkey patching built-in print
    def new_print(text: str) -> None:
        logging.warning(text)

    # Overriding print
    print = new_print  # type: ignore

    print("Hello, world!")
    print("Hi Bob!")
