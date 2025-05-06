number: int = 5

while number > 0:
    number -= 1
    if number == 2:
        print('Breaking at 2')
        break
    print(number)

print('Done')