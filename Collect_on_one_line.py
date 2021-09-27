#! /usr/bin/python

import subprocess
import sys

fname = sys.argv[1]
interfaces =  open(fname)
buf = interfaces.readlines()
line = ""
bs = []
print ( "%-12s %-70s %-10s %-20s %-20s %-20s" %("INTERFACE","DESCRIPTION","VRF","IP","SUBNET","HAS HELPER"))

for entry in buf:

  if "interface" in entry:
      bs = entry.split()
      inter = bs[1]
      line = bs[1]

  if "description" in entry:
     entry = entry.replace("description",'')
     entry = entry.rstrip()
     desc = entry
     #line = line + " DESC= " + entry

  if "vrf" in entry:
       bs  = entry.split()
       vrf = bs[3]
       line = line + " VRF= " + bs[3]

  if "ip address" in entry:
        bs  = entry.split()
        ip = bs[2]
        subnet = bs[3]
        line = line + " ADDRESS= " + bs[2]

  if "helper" in entry:
     bs = entry.split()
     line = line + "Has Helper"
     helper = 1

  if "!" in entry:
#       print ( "%s\n"  % line )
       if helper == 1:
          has_helper="YES"
       else:
          has_helper="NO"
       print ( "%-12s %-70s %-10s %-20s %-20s %-20s" %(inter,desc,vrf,ip,subnet,has_helper))
       line = ""
       helper = 0
