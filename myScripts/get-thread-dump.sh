#!/bin/bash
# this will get $max number of thread dumps with $time seconds interval
# provide pid as a param
max=10
sleep-time=20
for i in `seq 2 $max`
do
  echo "Saving thread dump $i"
  jstack -l $1 > thread-dump-$i-`date +%s`
  sleep $sleep-time
done
exit 0
