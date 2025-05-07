# Basic function example
def greet():
    print("----")
    print("Hello")

# Calling the function multiple times
greet()
greet()
greet()

# Modifying the function updates all calls
def greet():
    print("----")
    print("Ciao")

greet()
greet()
greet()

# Practical example with date and time
from datetime import datetime
import time

def show_time():
    now: datetime = datetime.now()
    print(f"The current time is: {now:%H:%M:%S}")

show_time()
time.sleep(2)
show_time()
