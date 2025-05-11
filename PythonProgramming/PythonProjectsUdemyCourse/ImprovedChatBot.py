from difflib import get_close_matches
from typing import Any, Dict, Optional

def get_best_match(user_question: str, knowledge: Dict[str, str]) -> Optional[str]:
    """
    Return the key in `knowledge` whose text is most similar to `user_question`,
    or None if no match exceeds the 60% similarity cutoff.
    """
    questions = list(knowledge.keys())
    matches = get_close_matches(user_question, questions, n=1, cutoff=0.6)
    return matches[0] if matches else None

def run_chat_bot(knowledge: Dict[str, str]) -> None:
    """
    Repeatedly prompt the user, find the best matching question,
    and print the corresponding answer or a default fallback.
    """
    while True:
        user_input = input("You: ")
        if user_input.lower() in ("exit", "quit"):
            print("Bot: Goodbye!")
            break

        best = get_best_match(user_input, knowledge)
        if best:
            response = knowledge[best]
            print(f"Bot: {response}")
        else:
            print("Bot: I do not understand.")

def main() -> None:
    brain: Dict[str, str] = {
        "hello": "hey there!",
        "how are you": "I am good, thanks!",
        "do you know what the time is": "No clue.",
        "what time is it": "No clue.",
        "what can you do": "I can answer questions!",
        "okay": "Great!"
    }
    run_chat_bot(brain)

if __name__ == "__main__":
    main()
