#!/bin/bash

# ================================
# Toggle Mute
# ================================
export mute_env="/Users/ben/.ben/mute_status.env"
export mic_volume="75"

function toggleMute(){
	STATUS=`cat $mute_env`
	CWD=pwd
	
	cd 
	
	if [ "$STATUS" = "MUTED" ]; then
		osascript -e "set volume input volume $mic_volume"
		STATUS="ON"
	else
		osascript -e "set volume input volume 0"
		STATUS="MUTED"
	fi
	
	echo $STATUS >! $mute_env
	
	if [ "$STATUS" = "MUTED" ]; then
		./Developer/benwestrate/dygma/keyboard-notifer/index.js red
	else 
		./Developer/benwestrate/dygma/keyboard-notifer/index.js
	fi
	
	if [ $1 ]; then
		echo "Your mic is now $STATUS"
	fi
	
	cd "$pwd"
}

function getMuteStatus() {

	if [ "$STATUS" = "MUTED" ]; then 
		echo " 🔕"; 
	else 
		echo "🎤"; 
	fi
	
}