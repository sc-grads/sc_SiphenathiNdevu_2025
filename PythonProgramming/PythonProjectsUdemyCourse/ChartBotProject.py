import sys
from datetime import datetime

# Function to handle bot responses
def get_response(text: str) -> str:
    lowered: str = text.lower()

    if lowered in ["hello", "hi", "hey"]:
        return "Hey there!"
    elif "how are you" in lowered:
        return "I'm good, thanks."
    elif "your name" in lowered:
        return "My name is Bot."
    elif "time" in lowered:
        current_time: datetime = datetime.now()
        return f"The time is {current_time:%H:%M}"
    elif lowered in ["bye", "goodbye", "see you"]:
        return "It was nice talking to you."
    else:
        return f"Sorry, I do not understand: {text}"

# Optional: Greet and ask for user's name
def greet_user():
    print("Bot: Hello, I am Bot. What's your name?")
    name = input("You: ")
    print(f"Bot: Nice to meet you, {name}!")

# Main chatbot loop
def chat():
    greet_user()
    while True:
        user_input: str = input("You: ")
        if user_input.lower() == "exit":
            print("Bot: It was a pleasure talking to you.")
            sys.exit()
        response = get_response(user_input)
        print("Bot:", response)

# Run the chatbot
chat()
