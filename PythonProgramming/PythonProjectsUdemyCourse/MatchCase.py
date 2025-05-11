# Python 3.10+ required

# Simple match-case example
status: int = 200

match status:
    case 200:
        print("Connected")
    case 403:
        print("Forbidden")
    case 404:
        print("Not Found")
    case _:
        print("Unknown")

# Pattern matching with command input
while True:
    user_input: str = input("Enter a command: ")
    command: list[str] = user_input.split()

    match command:
        case ["find", *images]:
            print(f"Finding images: {images}")
        case ["enlarge", image, amount]:
            print(f"You enlarged {image} by {amount}x")
        case ["rename", image, newname] if len(newname) > 3:
            print(f"{image} was renamed to {newname}")
        case ["download", *images]:
            print(f"Downloading images: {images}")
        case ("x" | "delete", *images):
            print(f"Deleting images: {images}")
        case _:
            print("Command not found.")
