#!/usr/bin/env python3
rows, columns, name = open(0).read().split()
rows = int(rows)
columns = int(columns)

for i in range(rows):
    for j in range(columns):
        print(f':{name}{i * columns + j + 1}:', end='')
    print()
