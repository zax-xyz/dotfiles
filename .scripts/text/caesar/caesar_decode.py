#!/usr/bin/env python
import os
import string
import sys

alpha = string.ascii_lowercase

decoded_occurence = {}
encoded_occurence = {}

decoded_percent = {}
encoded_percent = {}

differences = {}

# Get file from input and open
with open(os.path.join(sys.path[0], 'wiki_sentences.txt')) as f:
    decoded = f.read()

# Get encoded input from stdin
encoded = open(0).read()

# Count occurences of characters in encoded string and wiki
for i in alpha:
    decoded_occurence[i] = decoded.count(i)
    encoded_occurence[i] = encoded.count(i)

# Convert character counts into percentages
for char in decoded_occurence:
    decoded_percent[char] = decoded_occurence[char] / len(decoded)
for char in encoded_occurence:
    encoded_percent[char] = encoded_occurence[char] / len(encoded)

# Calculate cumulative differences in frequency of characters using different
# shift amounts
shifted = [x for x in alpha]
for i in range(1, 26):
    for n in range(25):
        tmp = shifted[0]
        shifted[n] = shifted[n + 1]

    shifted[25] = tmp
    differences[i] = 0

    for n in range(26):
        differences[i] += abs(
            decoded_percent[alpha[n]] - encoded_percent[shifted[n]]
        )

# Get lowest difference shift amount and create new list from shift
d = differences.items()
lowest = min(d, key=lambda x: x[1])
lowest = lowest[0]

shifted = []
for n in range(26):
    shifted.append(alpha[(n + lowest) % 26])

# Create dictionary linking alphabets together
shift_dict = dict(zip(shifted, alpha))
shift_dict.update({x.upper(): shift_dict[x].upper() for x in shift_dict})

# Get new alphabet
new_alpha = ''
for char in shift_dict:
    new_alpha += char

# Decode string
translation = ''
for char in encoded:
    translation += shift_dict.get(char, char)

print(translation, end='')
