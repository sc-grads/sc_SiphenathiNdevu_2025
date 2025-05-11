from typing import TextIO

# File path (make sure 'info.txt' exists in the same directory)
file_path: str = "info.txt"

# ---- Read Entire File ----
with open(file_path, "r") as txt:
    text: str = txt.read()
    print(text)
    print(text)  # Reading again from the stored variable works

# ---- Read File in Chunks (bytes) ----
with open(file_path, "r") as txt:
    print(txt.read(5))  # Reads first 5 bytes
    print(txt.read(5))  # Reads next 5 bytes
    print(txt.read())   # Reads the rest

# ---- Read File Line-by-Line ----
with open(file_path, "r") as txt:
    print(txt.readline(), end='')  # Line 1
    print(txt.readline(), end='')  # Line 2

# ---- Read All Lines as List ----
with open(file_path, "r") as txt:
    lines = txt.readlines()
    print(lines)
#Appending
with open(file_path, "a") as txt:
    txt.write("This file was created.\n")
#writing
with open(file_path, "w") as txt:
    txt.write("Ekser.\n")

