#!/usr/bin/env python

from glob import glob
from sys import argv, exit
import os

if len(argv) < 3:
    print("Usage: python %s indir outdir"%argv[0])
    exit(0)

indir = argv[1]
outdir = argv[2]

files = []
for fname in glob('%s/*'%indir):
    with open(fname) as f:
        files.append(f.read())

os.mkdir(outdir)
files = list(set(files))
for id,content in enumerate(files):
    with open('%s/%08d'%(outdir, id), 'w') as f:
        f.write(content)
