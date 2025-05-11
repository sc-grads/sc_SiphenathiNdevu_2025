n = 42
print(isinstance(n, int))      # True
print(isinstance(n, str))      # False

pi = 3.14
print(isinstance(pi, float))   # True

items = [1, 2, 3]
print(isinstance(items, list)) # True
print(isinstance(items, tuple))# False

value = 3.14
print(isinstance(value, (int, float)))  # True
class Animal: ...
class Cat(Animal): ...

c = Cat()
print(isinstance(c, Cat))      # True
print(isinstance(c, Animal))   # True  (Cat is subclass of Animal)
print(isinstance(Animal(), Cat))  # False
