#!/usr/bin/env python
d = {
    'o': 'owo',
    'O': 'OwO',
    'u': 'uwu',
    'U': 'UwU',
    'r': 'w',
    'R': 'W',
    'l': 'w',
    'L': 'W',
}

print(open(0).read().translate(str.maketrans(d)), end='')
