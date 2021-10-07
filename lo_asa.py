#! /usr/bin/python

import subprocess
import sys
import re

db = sys.argv[1]
log = sys.argv[2]

db_fd = open(db)
log_fd = open(log)

pattern = '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'
found = 0

# open log and read each line and grab ip
buf_log = log_fd.readlines()
buf_db = db_fd.readlines()
for entry in buf_log :
#  print entry
  match=re.search(pattern, entry)
  address = match.group()
#  print address
  address = re.sub('^SrcIP: ','',address)
#   address = re.sub(' DstIP$: ','',address)
  address = address.rstrip()
#   print ("This is the address %s\n",address)
  for entry2 in buf_db:
#    print entry2
     found = 0
     if address in entry2:
        entry=entry.strip()
        entry2=entry2.strip()
        print "%-250s -->    ##### SRC ##### is %s" %(entry,entry2)
        found = 1
        break
  if (found != 1):
      entry=entry.strip()
      print ("%-250s -->    &&&&& NOT FOUND SR &&&&&&& " %(entry2))

