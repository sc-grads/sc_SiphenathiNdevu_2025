import time
from typing import Callable, Any
from functools import wraps


# Decorator to time a function's execution
def get_time(func: Callable) -> Callable:
    """Times how long it takes to execute a function"""

    @wraps(func)
    def wrapper(*args, **kwargs) -> None:
        start_time: float = time.perf_counter()
        func(*args, **kwargs)
        end_time: float = time.perf_counter()
        total_time = f"{end_time - start_time:.3f}s"
        print(f"Time: {total_time}")

    return wrapper


@get_time
def calculate() -> None:
    """Calculate docstring"""
    time.sleep(2)
    print("Done")


# Decorator that repeats a function call x times
def repeat(num_times: int) -> Callable:
    """Repeat a function call x amount of times"""

    def decorator(func: Callable) -> Callable:
        @wraps(func)
        def wrapper(*args, **kwargs) -> Any:
            value: Any = None
            for _ in range(num_times):
                value = func(*args, **kwargs)
            return value

        return wrapper

    return decorator


@repeat(3)
def add(a: int, b: int) -> int:
    """A function used to add two numbers"""
    result = a + b
    print(f"{a} + {b} = {result}")
    return result


if __name__ == "__main__":
    calculate()
    print("---")
    result: int = add(1, 2)
    print(f"Result: {result}")
    print(f"Function name: {add.__name__}")
    print(f"Docstring: {add.__doc__}")
