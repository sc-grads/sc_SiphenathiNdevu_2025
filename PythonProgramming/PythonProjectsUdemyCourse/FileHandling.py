from typing import TextIO

# Define the path to your file (adjust as needed)
file_path: str = "info.txt"

# --------------------------
# Traditional file opening method with try/except/finally
# --------------------------
try:
    file: TextIO = open(file_path, "r")
    text: str = file.read()
    print(text)
    # Simulate a potential error (for demonstration)
    # raise Exception("Unknown error")  # Uncomment to test
except FileNotFoundError:
    print("Could not find the file.")
except Exception as e:
    print(f"Error: {e}")
finally:
    file.close()
    print("Force closing the file.")

# --------------------------
# Modern method using 'with' block
# --------------------------
try:
    with open(file_path, "r") as f:
        text: str = f.read()
        print(text)
except FileNotFoundError:
    print(f"No file found at: {file_path}")
