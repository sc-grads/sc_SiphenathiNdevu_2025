from datetime import datetime
import asyncio
from asyncio import Future
import requests
from requests import Response
from typing import List

# Function to fetch status using asyncio.to_thread to avoid blocking
async def fetch_status(url: str) -> dict:
    print(f"Fetching: {url}")
    start_time = datetime.now()

    try:
        response: Response = await asyncio.to_thread(requests.get, url)
        status_code = response.status_code
    except requests.RequestException as e:
        status_code = f"Error: {e}"

    end_time = datetime.now()
    return {
        "url": url,
        "status": status_code,
        "start": start_time.strftime("%H:%M:%S"),
        "end": end_time.strftime("%H:%M:%S")
    }

# Main function to manage tasks
async def main():
    urls = [
        "https://www.google.com",
        "https://www.github.com",
        "https://www.python.org",
        "https://www.stackoverflow.com",
        "https://thisurldoesnotexist.tld"
    ]

    # Create tasks for all URLs
    tasks: List[Future] = [fetch_status(url) for url in urls]

    # Run all tasks concurrently and get results
    results = await asyncio.gather(*tasks, return_exceptions=True)

    # Display results
    for result in results:
        if isinstance(result, dict):
            print(f"{result['url']} | Status: {result['status']} | Start: {result['start']} | End: {result['end']}")
        else:
            print(f"Error occurred: {result}")

# Example: Using lambdas
# Define a lambda function to add two numbers
add = lambda a, b: a + b
print(add(4, 12))  # Output: 16

# Define a lambda for one-time printing
p = lambda x: print(x)
p(10)
p("Hello")

# Function that applies a callable to each value in a list
def use_all(function: callable, values: List[int]) -> None:
    for value in values:
        function(value)

# Example using lambda directly in function call
use_all(lambda value: print(f"{value} x"), [2, 4, 10])

# Regular function alternative to lambda
def multiply_x(value: int) -> None:
    print(f"{value} x")

use_all(multiply_x, [2, 4, 10])

# Example: Sorting with lambdas
names: List[str] = ["Bob", "James", "Samantha", "Luigi", "Joe"]
sorted_names: List[str] = sorted(names, key=lambda x: len(x))
print(sorted_names)

# Case-insensitive sort
names_case_insensitive = ["bob", "James", "samantha", "Luigi", "joe"]
sorted_names_ci = sorted(names_case_insensitive, key=lambda x: x.lower())
print(sorted_names_ci)
