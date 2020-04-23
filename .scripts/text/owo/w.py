#!/usr/bin/env python
d = {
    'r': 'w',
    'l': 'w',
}

d = {k.title(): v.title() for k, v in d.items()}

print(open(0).read().translate(str.maketrans(d)), end='')
