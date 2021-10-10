#!/bin/bash
#Wifi

wifi=$(idevicediagnostics mobilegestalt WifiAddress | grep string | sed '/Success/d' | sed -e 's/\<string>//g;s/\<\/string>//g' | xargs | wc -l)

if [ ${wifi} -ge 1 ]; then
	echo "Wi-Fi Pass"
else 
	echo "Fail"
fi

