import time

def connect_to_internet(signal: bool, delay: int) -> None:
    if delay > 5:
        signal = True

    if signal:
        print("Connected!")
        return
    else:
        print(f"Connection failed. Trying again in {delay}s...")
        time.sleep(delay)
        connect_to_internet(signal, delay + 2)

# Initial call
connect_to_internet(False, 0)
