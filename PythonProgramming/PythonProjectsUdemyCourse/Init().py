import sys

class Connection:
    def __init__(self, connection_type: str, cost: float) -> None:
        print(f"{connection_type} connection established! (Cost: ${cost}/h)")
        self.connection_type = connection_type
        self.cost = cost

    def close_connection(self) -> None:
        print(f"Closing {self.connection_type} connection...")

def main() -> None:
    # Create two connections with different types and costs
    internet: Connection = Connection("Internet", 2.0)
    satellite: Connection = Connection("Satellite", 20.0)

    # ... do work with the connections here ...

    # When done, close them
    internet.close_connection()
    satellite.close_connection()

if __name__ == "__main__":
    main()
