import sys


def welcome_message() -> None:
    print("\nWelcome to Groceries!")
    print("-" * 30)
    print("1: Add an item")
    print("2: Remove an item")
    print("3: List all items")
    print("0: Exit")
    print("-" * 30)


def add_item(item: str, groceries: list[str]) -> None:
    groceries.append(item)
    print(f"'{item}' has been added.\n")


def remove_item(item: str, groceries: list[str]) -> None:
    try:
        groceries.remove(item)
        print(f"'{item}' has been removed.\n")
    except ValueError:
        print(f"No '{item}' found in the list.\n")


def display_items(groceries: list[str]) -> None:
    print("\n___ Groceries List ___")
    if not groceries:
        print("(empty)\n")
        return
    for idx, item in enumerate(groceries, start=1):
        print(f"{idx}. {item.capitalize()}")
    print("_" * 20 + "\n")


def is_valid_option(choice: str) -> bool:
    return choice in {"0", "1", "2", "3"}


def main() -> None:
    groceries: list[str] = []
    welcome_message()

    while True:
        choice = input("Choose an option: ").strip().lower()
        if not is_valid_option(choice):
            print("Please pick a valid option…\n")
            continue

        if choice == "1":
            item = input("Enter item to add: ").strip().lower()
            if item:
                add_item(item, groceries)
            else:
                print("Cannot add an empty item.\n")

        elif choice == "2":
            item = input("Enter item to remove: ").strip().lower()
            remove_item(item, groceries)

        elif choice == "3":
            display_items(groceries)

        elif choice == "0":
            print("Exiting program. Goodbye!")
            sys.exit()


if __name__ == "__main__":
    main()
