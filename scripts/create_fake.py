import json
from faker import Faker

fake = Faker()

data = {
    "names": [],
    "emails": [],
}

for _ in range(100):
    data["names"].append(fake.name())
    data["emails"].append(fake.email())

with open("fakes.json", "w") as sample:
    json.dump(data, sample)
