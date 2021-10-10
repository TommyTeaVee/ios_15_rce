#!/bin/bash
#This script just echos a string or hello

proximity=$(idevicediagnostics mobilegestalt proximity-sensor | grep -A2 "proximity-sensor" | grep true | wc -l)

if [ ${proximity} -ge 1 ]; then
	echo "Proximity Pass"
else 
	echo "Fail"
fi

