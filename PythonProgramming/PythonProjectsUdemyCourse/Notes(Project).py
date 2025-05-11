from dataclasses import dataclass, field
from uuid import uuid4, UUID
from typing import List, Optional

# Define the Note as a data class
@dataclass
class Note:
    id: UUID = field(init=False)  # Unique identifier for each note, not set at init
    title: str
    body: str

    def __post_init__(self):
        self.id = uuid4()  # Generate a unique ID after initialization

# Define the NoteApp class to manage notes
class NoteApp:
    def __init__(self, author: str, notes: Optional[List[Note]] = None) -> None:
        self.author = author
        self._notes: List[Note] = [] if notes is None else notes
        self.display_instructions()

    @staticmethod
    def display_instructions() -> None:
        print("Welcome to Notes!")
        print("Here are the commands:")
        print("1. Add a new note")
        print("2. Edit a note")
        print("3. Delete a note")
        print("4. Display all notes")
        print("5. Show instructions again")
        print("6. Note statistics")

    def _add_note(self) -> None:
        title: str = input("Title: ")
        body: str = input("Body: ")
        if not title.strip() or not body.strip():
            print("Title and body cannot be empty.")
            return
        note: Note = Note(title=title, body=body)
        self._notes.append(note)
        print("Note was added.")

    def _edit_note(self) -> None:
        print("Which note would you like to edit?")
        self.show_notes()
        try:
            note_index: int = int(input("Index: ")) - 1
            current_note: Note = self._notes[note_index]
            new_title: str = input("New Title: ")
            new_body: str = input("New Body: ")
            current_note.title = new_title
            current_note.body = new_body
            print("Note was updated.")
        except IndexError:
            print("Please select a valid note index.")
            self._edit_note()
        except ValueError:
            print("Index cannot be empty. Aborting operation.")

    def _delete_note(self) -> None:
        print("Which note would you like to delete?")
        self.show_notes()
        try:
            note_index: int = int(input("Index: ")) - 1
            del self._notes[note_index]
            print("Note was deleted.")
        except IndexError:
            print("Please select a valid note index.")
            self._delete_note()
        except ValueError:
            print("Index cannot be empty. Aborting operation.")

    def show_notes(self) -> None:
        if not self._notes:
            print("No notes available.")
            return
        for index, note in enumerate(self._notes, start=1):
            print(f"{index}. {note.title}: {note.body}")

    def _note_statistics(self) -> None:
        total_notes = len(self._notes)
        total_characters = sum(len(note.title) + len(note.body) for note in self._notes)
        print(f"Total notes: {total_notes}")
        print(f"Total characters (title + body): {total_characters}")
        print(f"Author: {self.author}")

    def select_option(self, user_input: str) -> None:
        if user_input not in {"1", "2", "3", "4", "5", "6"}:
            print("Please pick a valid option.")
            return
        if user_input == "1":
            self._add_note()
        elif user_input == "2":
            self._edit_note()
        elif user_input == "3":
            self._delete_note()
        elif user_input == "4":
            self.show_notes()
        elif user_input == "5":
            self.display_instructions()
        elif user_input == "6":
            self._note_statistics()

    def run_app(self) -> None:
        while True:
            user_input: str = input("\nYou: ")
            self.select_option(user_input)

# Sample usage
if __name__ == "__main__":
    sample_notes: List[Note] = [
        Note(title="Title 1", body="Hello there Bob"),
        Note(title="Title 2", body="This is more text")
    ]
    note_app: NoteApp = NoteApp(author="Bob", notes=sample_notes)
    note_app.run_app()
