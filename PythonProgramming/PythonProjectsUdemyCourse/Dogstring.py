"""This module demonstrates how to write and access Python docstrings."""

from typing import Set


class User:
    """Base class for creating application users.

    Attributes:
        user_id (int): Unique identifier for the user.
    """

    def __init__(self, user_id: int) -> None:
        """Initialize a User with the given integer ID."""
        self.user_id = user_id

    def show_id(self) -> None:
        """Print the user’s ID to the console."""
        print(self.user_id)


def user_exists(user: User, database: Set[User]) -> bool:
    """
    Check if `user` is present in `database`.

    :param user: the User instance to look for
    :param database: a set of User objects
    :return: True if `user` is in `database`, else False
    """
    return user in database

def main() -> None:
    alice = User(1)
    bob = User(2)
    db = {alice, bob}

    # Accessing docstrings at runtime:
    print("Module doc:", __doc__)
    print("Class doc:", User.__doc__)
    print("Method doc:", User.show_id.__doc__)
    print("Function doc:", user_exists.__doc__)

    # Using the code
    alice.show_id()  # prints: 1

    if user_exists(User(2), db):
        print("Bob is in the database.")
    else:
        print("Bob not found.")


if __name__ == "__main__":
    main()
