import asyncio
from datetime import datetime
from typing import Any, List, Dict


# Simulated async API call
async def fetch_data(input_data: int, delay: int, fails: bool = False) -> Dict[str, Any]:
    print(f"[{input_data}] Fetching data...")
    start_time = datetime.now()
    await asyncio.sleep(delay)
    if fails:
        raise Exception("Something went wrong.")
    end_time = datetime.now()
    return {
        "input": input_data,
        "start": start_time.strftime("%H:%M:%S"),
        "end": end_time.strftime("%H:%M:%S")
    }


async def main() -> None:
    # Start multiple fetch_data coroutines concurrently using asyncio.gather
    tasks = asyncio.gather(
        fetch_data(1, 1, fails=False),
        fetch_data(2, 2, fails=False),
        fetch_data(3, 3, fails=True),  # This will fail
        return_exceptions=True
    )

    results: List[Dict[str, Any]] = await tasks

    # Display results, showing exceptions if any
    for i, result in enumerate(results, 1):
        if isinstance(result, Exception):
            print(f"Task {i} failed: {result}")
        else:
            print(f"Task {i} succeeded: {result}")


if __name__ == "__main__":
    asyncio.run(main())
