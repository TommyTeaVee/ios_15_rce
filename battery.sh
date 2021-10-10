#!/bin/bash
#This script just echos a string or hello

battery=$(idevicediagnostics diagnostics | grep -A9 "GasGauge" | grep "Success" | wc -l)

if [ ${battery} -ge 1 ]; then
	echo "Battery Pass"
else 
	echo "Fail"
fi

