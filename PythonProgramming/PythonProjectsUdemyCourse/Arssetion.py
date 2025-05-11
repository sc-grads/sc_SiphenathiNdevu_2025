def start_program(database: dict[int, str]) -> None:
    # Assertion: ensure the database is not empty
    assert database, "Database is empty"

    print("Database loaded successfully.")
    print("Program started successfully.")

if __name__ == "__main__":
    # Test case: working database
    db1: dict[int, str] = {
        0: "A",
        1: "B"
    }
    start_program(db1)

    # Uncomment this to see the assertion in action:
    # db2: dict[int, str] = {}
    # start_program(db2)
