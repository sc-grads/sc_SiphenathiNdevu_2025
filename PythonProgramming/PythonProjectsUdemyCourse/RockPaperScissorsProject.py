import random
import sys

# Welcome message
print("Welcome to RPS - Rock, Paper, Scissors!")

# Step 1: Define moves with emojis (optional)
moves: dict = {
    "rock": "🪨",
    "paper": "📄",
    "scissors": "✂️"
}

valid_moves: list[str] = list(moves.keys())

# Step 2: Main game loop
while True:
    user_move: str = input("Rock, Paper, or Scissors? ").lower()

    if user_move == "exit":
        print("Thanks for playing!")
        sys.exit()

    if user_move not in valid_moves:
        print("Invalid move. Try again.")
        continue

    # AI chooses a move
    ai_move: str = random.choice(valid_moves)

    # Display both moves
    print("----------")
    print(f"You: {moves[user_move]}")
    print(f"AI : {moves[ai_move]}")
    print("----------")

    # Step 3: Determine outcome
    # Check moves
    if user_move == ai_move:
        print("It is a tie!")
    elif user_move == "rock" and ai_move == "scissors":
        print("You win!")
    elif user_move == "scissors" and ai_move == "paper":
        print("You win!")
    elif user_move == "paper" and ai_move == "rock":
        print("You win!")
    else:
        print("AI wins...")

