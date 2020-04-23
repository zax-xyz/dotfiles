#!/usr/bin/env python
alpha = 'abcdefghijklmnopqrstuvwxyz'
emoji_alpha = '🇦🇧🇨🇩🇪🇫🇬🇭🇮🇯🇰🇱🇲🇳🇴🇵🇶🇷🇸🇹🇺🇻🇼🇽🇾🇿'

d = str.maketrans(dict(zip(alpha, emoji_alpha)))

print(' '.join(open(0).read().lower().translate(d)), end='')
