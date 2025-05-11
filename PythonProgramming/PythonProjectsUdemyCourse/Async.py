import asyncio
from asyncio import Task
from datetime import datetime
from typing import Dict


# Async function to simulate fetching data from an API
async def fetch_data(input_data: str) -> Dict[str, str]:
    print(f"Fetching data for input: {input_data}...")

    start_time = datetime.now()
    await asyncio.sleep(3)  # Simulate a delay in data fetching
    end_time = datetime.now()

    print(f"Data retrieved for input: {input_data}")

    return {
        "input": input_data,
        "start_time": start_time.strftime("%M:%S"),
        "end_time": end_time.strftime("%M:%S")
    }


# Async main function where the program starts
async def main():
    # Create tasks for concurrent execution
    task1: Task = asyncio.create_task(fetch_data("1"))
    task2: Task = asyncio.create_task(fetch_data("2"))

    # Await both tasks to get results
    data1 = await task1
    data2 = await task2

    # Display results
    print(f"\ndata1 = {data1}")
    print(f"data2 = {data2}")


# Entry point to run the async program
if __name__ == "__main__":
    asyncio.run(main())
