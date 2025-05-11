# Timing Code with the timeit Module in Python

from timeit import timeit, repeat

# Timing simple code snippets
a = "list(range(1000))"
b = "set(range(1000))"

# Warm-up run
timeit(stmt=a, number=100_000)

# Measure execution time
a_time = timeit(stmt=a, number=100_000)
b_time = timeit(stmt=b, number=100_000)

print(f"List time: {a_time:.3f}s")
print(f"Set time: {b_time:.3f}s")

# Using repeat for more consistent results
c = "set(range(1000))"
a_repeat = min(repeat(stmt=a, number=100_000, repeat=5))
b_repeat = min(repeat(stmt=b, number=100_000, repeat=5))
c_repeat = min(repeat(stmt=c, number=100_000, repeat=5))

print(f"Repeat list: {a_repeat:.3f}s")
print(f"Repeat set B: {b_repeat:.3f}s")
print(f"Repeat set C: {c_repeat:.3f}s")

# Example with setup
power_time = timeit(stmt="a**b", setup="a, b = 10, 3")
print(f"Power (a**b) time: {power_time:.3f}s")

# Using math.pow
math_pow_time = timeit(stmt="math.pow(10, 3)", setup="import math")
print(f"math.pow time: {math_pow_time:.3f}s")

# Using math.pow with from-import and setup string
setup_code = """
from math import pow
a = 10
b = 3
"""
setup_stmt = "pow(a, b)"
setup_time = timeit(stmt=setup_stmt, setup=setup_code)
print(f"pow(a, b) with setup: {setup_time:.3f}s")
