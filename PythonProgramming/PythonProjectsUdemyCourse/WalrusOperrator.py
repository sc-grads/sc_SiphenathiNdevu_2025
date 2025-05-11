from datetime import datetime
import asyncio
from asyncio import Future
import requests
from requests import Response
from typing import List, Dict, Optional

# Function to describe numbers using the walrus operator
def description(numbers: List[int]) -> Dict[str, float]:
    return {
        "length": (n_len := len(numbers)),
        "sum": (n_sum := sum(numbers)),
        "mean": n_sum / n_len
    }

# Demonstrating the walrus operator in an if statement
items: Dict[int, str] = {1: "cup", 2: "chair"}

if (item := items.get(3)):
    print(f"You have the item: {item}")
else:
    print("No item found.")

# Using the walrus operator in a simple expression
x = (result := 1 + 0)
print(f"Result: {result}")
print(f"X: {x}")
