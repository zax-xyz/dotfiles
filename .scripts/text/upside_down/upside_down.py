#!/usr/bin/env python
alpha = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
upside_down_alpha = 'ɐqɔpǝɟƃɥıɾʞןɯuodbɹsʇnʌʍxʎz∀qƆpƎℲפHIſʞ˥WNOԀQɹS┴∩ΛMX⅄Z'

d = str.maketrans(dict(zip(alpha, upside_down_alpha)))

print(open(0).read().translate(d)[::-1], end='')
