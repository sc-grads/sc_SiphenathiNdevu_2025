# Notepad App in Python

import sys

class Notepad:
    def __init__(self, author: str, file_name: str) -> None:
        self.author = author
        self._file_name = file_name

    def show_instructions(self) -> None:
        print(f"Welcome to Notepad, {self.author}!")
        print("Press 1 to write a note")
        print("Press 2 to display the note")
        print("Press 0 to exit the notepad")

    def write_note(self) -> None:
        user_input: str = input("Enter a note: ")
        with open(self._file_name, "w") as note:
            note.write(user_input)
        print("Bot: Note successfully created.")

    def display_note(self) -> None:
        try:
            with open(self._file_name, "r") as note:
                text: str = note.read()
                print(f"Bot: {text}")
        except FileNotFoundError:
            print("Bot: You need to write a note first.")

    def exit_notepad(self) -> None:
        print(f"See you next time, {self.author}!")
        sys.exit()

    def run(self) -> None:
        self.show_instructions()
        while True:
            user_input: str = input(f"{self.author}: ")
            if user_input not in ("0", "1", "2"):
                print("Bot: Please enter a valid choice.")
                continue

            if user_input == "1":
                self.write_note()
            elif user_input == "2":
                self.display_note()
            elif user_input == "0":
                self.exit_notepad()
            else:
                print(f"Bot: Unknown command {user_input}")

if __name__ == "__main__":
    notepad: Notepad = Notepad(author="Bob", file_name="notes.txt")
    notepad.run()
