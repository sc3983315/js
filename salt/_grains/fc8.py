#!/usr/bin/python
import commands
def cange():
#  grains = {}
#  grains['CANGE'] = 'cange'
#  grains['CANYE'] = 'canye'
#  return grains
   sc={}
   sc['disk_num'] = commands.getoutput('fdisk -l|grep Disk|wc -l')
   sc['disk_big'] = commands.getoutput("fdisk -l|grep Disk|grep /dev/sdc|awk '{print $3}'")
   return sc
 

