#!/usr/bin/env python
d = {
    'o': 'owo',
    'O': 'OwO',
    'u': 'uwu',
    'U': 'UwU',
}

print(open(0).read().translate(str.maketrans(d)), end='')
