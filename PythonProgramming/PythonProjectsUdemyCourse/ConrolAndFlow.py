#Check the persons age
age: int = 30


if age >= 21:
    print('You are an adult')
elif age>= 18:
    print('You are a young adult ')
elif age > 12:
    print('you are a teenager.')
else:
    print('unknown age.')

#Check Weather
weather: str = 'cloudy'

if weather == 'clear':
    print('It is a nice day!')
elif weather == 'cloudy':
    print('The weather clould be better...')
elif weather == 'rainy':
    print('What an awful day!')
else:
    print('Unknown weather...')