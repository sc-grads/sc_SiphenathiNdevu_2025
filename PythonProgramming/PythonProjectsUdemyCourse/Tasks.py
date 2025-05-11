import asyncio
from asyncio import Task
from datetime import datetime
from typing import Dict

# Simulated API call using asyncio
async def fetch_data(input_data: str, delay: int) -> Dict[str, str]:
    print(f"\nFetching data for {input_data}...")
    start_time = datetime.now()
    await asyncio.sleep(delay)
    end_time = datetime.now()

    print(f"Data retrieved for {input_data}.")
    return {
        "input": input_data,
        "start_time": start_time.strftime("%M:%S"),
        "end_time": end_time.strftime("%M:%S"),
    }

# Main async function
async def main():
    print("\n--- Task Creation and Execution ---")
    task: Task = asyncio.create_task(fetch_data("1", 3))
    await asyncio.sleep(1)
    print("Running other code while task is active...")

    data = await task
    print("Result:", data)
    print("Task done?", task.done())

    print("\n--- Task Cancellation ---")
    task = asyncio.create_task(fetch_data("2", 10))
    await asyncio.sleep(1)
    task.cancel("Took too long")  # Cancel the task with a message
    try:
        data = await task
    except asyncio.CancelledError as e:
        print("Task was cancelled:", e)
    print("Was task cancelled?", task.cancelled())

    print("\n--- Accessing Task Result Safely ---")
    task = asyncio.create_task(fetch_data("3", 3))
    await asyncio.sleep(1)
    try:
        result = task.result()  # Access too early
    except asyncio.InvalidStateError as e:
        print("Cannot access result yet:", e)

    await task  # Wait for completion
    print("Task done?", task.done())
    if task.done():
        print("Final result:", task.result())

    print("\n--- Timeout Example ---")
    task = asyncio.create_task(fetch_data("5", 30))
    try:
        data = await asyncio.wait_for(task, timeout=3)
        print("Data:", data)
    except asyncio.TimeoutError:
        print("Request took too long!")

    # Quick successful example
    task = asyncio.create_task(fetch_data("6", 1))
    try:
        data = await asyncio.wait_for(task, timeout=3)
        print("Data:", data)
    except asyncio.TimeoutError:
        print("Request took too long!")

# Run the async script
