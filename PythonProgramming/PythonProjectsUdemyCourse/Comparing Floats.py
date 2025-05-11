import math

# Problem demonstration
print(0.1 + 0.2 == 0.3)      # False

# isclose with an absolute tolerance (max difference)
print(math.isclose(0.1 + 0.2, 0.3, abs_tol=1e-9))   # True

# isclose with a relative tolerance (percentage difference)
# e.g. allow 1% difference
print(math.isclose(99.5, 100.0, rel_tol=0.01))      # True

# Combine both tolerances
print(math.isclose(95.0, 100.0, rel_tol=0.01, abs_tol=5.0))  # True
