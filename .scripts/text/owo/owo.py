#!/usr/bin/env python
d = {
    'o': 'owo',
    'O': 'OwO',
}

print(open(0).read().translate(str.maketrans(d)), end='')
