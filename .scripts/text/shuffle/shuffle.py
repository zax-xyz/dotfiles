#!/usr/bin/env python
import random


string = list(open(0).read())
random.shuffle(string)

print(''.join(string), end='')
