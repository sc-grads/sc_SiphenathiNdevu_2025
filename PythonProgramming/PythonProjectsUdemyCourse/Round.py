a: float = 200.312399
b: float =  18.12132
c: float =  47.12312

result: float = a + b + c
print(round(result, 2))
print(round(result, 2))   # two decimal places
print(round(result, 1))   # one decimal place
print(round(result, 0))   # nearest integer (still a float)
print(round(result, -1))  # nearest 10
print(round(result, -2))  # nearest 100
