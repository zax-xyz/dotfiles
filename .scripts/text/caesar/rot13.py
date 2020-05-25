#!/usr/bin/env python
from codecs import encode

print(encode(open(0).read(), encoding='rot13'))
