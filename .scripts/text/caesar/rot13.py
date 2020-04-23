#!/usr/bin/env python
from string import ascii_lowercase, ascii_uppercase


def encode(char, charset):
    index = charset.index(char)
    return charset[index - 13]


def get_encoded(char):
    for charset in (ascii_lowercase, ascii_uppercase):
        if char in charset:
            return encode(char, charset)
    else:
        return char


print(''.join(get_encoded(c) for c in open(0).read()), end='')
