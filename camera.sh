s#!/bin/bash

echo "Press Power"

vibrate=$(timelimit -q -t3 idevicesyslog | grep -o "Lock usagePage:0xc usage:0x30 downEvent:0 up\|Received display status: is_on false\|Lock button single press recognized" | wc -l)

if [ ${vibrate} -ge 1 ]; then
	echo "Power Pass"
else
	echo "Fail"
fi


#
#    DIAGNOSTICS=$HOME/The_Drive/bash_profile/dev/logs/OEM/APPLE/DIAGNOSTICS_LOGS
#
#    RED='\033[0;31m'
#    PURPLE='\033[0;35m'
#    YELLOW='\033[1;33m'
#    ORANGE='\033[0;33m'
#    CYAN='\033[1;36m'
#    NC='\033[0m' # No Color
#
#    rd_software_version=$(echo "RC-1.1b")
#
#
#    time_date=`date +'%a-%h-%d-%Y-%I_%M_%S-%Z'`
#
##    pause(){
##
##        read -p "The selected process has completed. Press The 'Enter' Key, and select an option." fackEnterKey
##    }
#
#    space(){
#
#    echo ""
#
#    }
#
#    double_space(){
#
#    echo ""
#    echo ""
#
#    }
#
#   udid=$(ideviceinfo -s -k UniqueDeviceID)
#
#   ios_power(){
#
#                        printf "\n${ORANGE}[GET READY] Press Power 2 Times After Count Down${NC}"
#                        double_space
#                        sleep_1
#
#                         # I'm making sure that I control the button presses and the way the diagnostics are run
#                         # If we allow the users to perform whatever function they want to at anytime, there will be
#                         # no constant we can follow, and we cannot develop machine learning in the future.
#                         # The results will be more accurate and precise as well.
#
#
#                         # I'm doing a 3 second count down for the user to double tap the power
#
#                         termdown 2
#
#
#                        printf "\n${CYAN}[ATTENTION] Press Power Button Now ${NC}"
#                        sleep 1
#                        printf "\n${CYAN}[ATTENTION] Press Power Button Again${NC}"
#
#                            timelimit -q -t8 idevicesyslog > ${DIAGNOSTICS}/${udid}/power.log
#
#                        }
#
#                        ios_power
#
#                        ios_power_result(){
#
#                           # Lock usagePage:0xc usage:0x30 downEvent:0 up
#                           # Received display status: is_on false
#                           # Lock button single press recognized
#
#                            good=$(cat ${DIAGNOSTICS}/${udid}/power.log | grep -o "Lock usagePage:0xc usage:0x30 downEvent:0 up\|Received display status: is_on false\|Lock button single press recognized" | wc -l)
#
#                           if [[ ${good} -ge 1 ]]; then
#
#                             printf "\n${PURPLE}[INFO]${NC} Power Button: Full Function"
#
#                           elif [[ ${good} -eq 0 ]]; then
#
#                             printf "\n${PURPLE}[INFO]${NC} Power Button: HW Mismatch"
#
#                           else
#
#                           printf "\n${ORANGE}[ADVISORY]${NC} Power Button: Functionality Unknown"
#
#                           fi
#
#
#
#                        }
#
#
#                            ios_power_result | tee ${DIAGNOSTICS}/${udid}/power_result.log
#                            space
#
#                        # This is the variable going to the database
#                        ios_power_out_db=$(cat ${DIAGNOSTICS}/${udid}/power_result.log | awk -F 'Button:' '{print $NF}' | xargs)
