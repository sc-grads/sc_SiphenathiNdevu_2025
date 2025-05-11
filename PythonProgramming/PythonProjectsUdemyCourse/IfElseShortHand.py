#Shorthand
condition: bool = False
var: str = 'True' if condition else 'False'

#Blocks
if condition:
    var: str = 'True'
else:
    var: str = 'False'

print(var)