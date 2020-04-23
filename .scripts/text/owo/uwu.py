#!/usr/bin/env python
d = {
    'u': 'uwu',
    'U': 'UwU',
}

print(open(0).read().translate(str.maketrans(d)), end='')
