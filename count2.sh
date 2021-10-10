#!/bin/bash
#This is a modified version of the count.sh script in the ten minute tutorial
C=$1
if [ "$C" -eq "$C" ] 2>/dev/null; then
    # $C is a number
    for COUNT in $(seq 1 $C); do
      echo $COUNT
      sleep 1
    done
else
    echo "Sorry, I can't count to $C"
fi
exit