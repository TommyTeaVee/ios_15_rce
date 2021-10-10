#!/bin/bash
# idevicepair pair
# bluetooth=$(idevicediagnostics mobilegestalt BluetoothAddress | grep string | sed '/Success/d' | sed -e 's/\<string>//g;s/\<\/string>//g' | xargs | wc -l)
#
# if [ ${bluetooth} -ge 1 ]; then
# 	echo "Bluetooth Pass"
# else
# 	echo "Fail"
# fi
#

ideviceinfo -k InternationalMobileEquipmentIdentity