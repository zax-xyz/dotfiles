#!/usr/bin/env python
alpha = 'abcdefghijklmnopqrstuvwxyz'
upside_down_alpha = 'ɐqɔpǝɟƃɥıɾʞןɯuodbɹsʇnʌʍxʎz'

d = str.maketrans(dict(zip(alpha, upside_down_alpha)))

print(open(0).read().translate(d)[::-1], end='')
