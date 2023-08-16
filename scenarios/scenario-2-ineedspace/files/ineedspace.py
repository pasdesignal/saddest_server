#! /usr/bin/python3
# test holdfile open

import random
import time
import os

#create bigfile
cmd = 'head -c 50000000 /dev/urandom > /tmp/bigfile'
os.system(cmd)

#hold bigfile open
with open('/tmp/bigfile', 'a') as f:
    while True:
        time.sleep(10)
