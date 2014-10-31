#!/bin/bash

while :
do
    echo "Henter data..."
	#JSON=$(curl http://www.vondess.com/mannen/api)
        JSON='{ "falt_ned": true }'

	if [ $? -eq 0 ]; then
		HAR_RAMLET_NED=$(echo $JSON | jq -r '.falt_ned')

		echo " => $HAR_RAMLET_NED"

		if [ "$HAR_RAMLET_NED" == "true" ]; then
		    while :
		    do
			    echo "MANNEN HAR RAMLET NED!!"
			    
				for i in `seq 1 3`;
				do
					./lamp on
					sleep 0.2
					./lamp off
					sleep 0.3
				done
				sleep 15
		    done
		else
		    echo "Mannen har enda ikke ramlet ned"
		    sleep 60
		fi
	else
		echo "Nettverksfeil.." 
		sleep 60
	fi
done
