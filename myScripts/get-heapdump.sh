#!/bin/bash
# this will get $max number of heap dumps with $time seconds interval
# provide pid as a param
max=4
sleep-time=3600
for i in `seq 1 $max`
do
  jmap -dump:file=heap-dumps/node2-`date +%s`.hprof $1
  sleep $sleep-time
done
