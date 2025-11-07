#!/usr/bin/python

import random
import string

def rand_name():
    return ''.join(random.choice(string.ascii_lowercase) for _ in range(3))

print(rand_name())
