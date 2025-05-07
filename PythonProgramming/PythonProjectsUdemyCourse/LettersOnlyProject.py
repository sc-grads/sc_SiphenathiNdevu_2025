import string


# Function to check if text contains only letters
def is_letters_only(text: str) -> None:
    alphabet: str = string.ascii_letters + ' '

    for char in text:
        if char not in alphabet:
            raise ValueError("Text can only contain English letters and spaces.")

    print("The text is letters only.")


# Main function entry point
def main() -> None:
    while True:
        try:
            user_input: str = input("Check text: ")
            is_letters_only(user_input)
        except ValueError:
            print("Please only enter English letters.")
        except Exception as e:
            print(f"Encountered an unknown exception: {e}")
            print(f"Exception type: {type(e)}")


# Run the program
main()
