#!/usr/bin/env python

from glob import glob
import os

files = []
for fname in glob('fixed/*'):
    with open(fname) as f:
        files.append(f.read())

os.mkdir('uniques')
files = list(set(files))
for id,content in enumerate(files):
    with open('uniques/%08d'%id, 'w') as f:
        f.write(content)
