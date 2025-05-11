import json

# Path to your JSON file
file_path = "data.json"

# Open and read the JSON file
with open(file_path, "r") as file:
    data = json.load(file)

# Print the data
print(data)

# Access specific values
print("Name:", data["name"])
print("Age:", data["age"])
print("Friends:", ", ".join(data["friends"]))
print("Other Info:", data["other_info"])
