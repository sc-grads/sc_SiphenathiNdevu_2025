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


# Run the app
if __name__ == "__main__":
    asyncio.run(main())
