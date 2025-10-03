import random

class Hat:

    houses = ["Gryffindor", "Huffelpuff", "Ravenclaw", "Slytherin"]

    @classmethod
    def sort(cls, name):
        print(name, "is in", random.choice(cls.houses))



Hat.sort("Harry")
