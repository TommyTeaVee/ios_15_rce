#!/bin/bash
#This script just echos a string or hello

vibrate=$(timelimit -q -t6 idevicesyslog | grep "libVibeSynthEngine" | wc -l)

if [ ${vibrate} -ge 1 ]; then
	echo "Vibration Pass"
else 
	echo "Vibration Fail"
fi

