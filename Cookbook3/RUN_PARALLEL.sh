#!/bin/bash 
date > log_Date
uname -n       > log_machine
CPU=`grep -c ^processor /proc/cpuinfo`
ls -l ../conman > log_bin
COUNT=0
for dir in  ./test_*  ; do
   ./run_us.bash $dir &
   P1=$!
   COUNT=$((COUNT + 1))
   if (($COUNT == $CPU)) ; then
       wait $P1
       COUNT=0
   fi
done
