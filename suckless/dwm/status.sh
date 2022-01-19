#!/bin/sh

dte(){
	dte=$(date +"%a %d %b")
	echo " $dte"
}

tme(){
	tme=$(date +"%R")
	echo " $tme"
}

mem(){
	mem=$(free -h | awk '/Mem/ {printf "%s\n", $3}')
	echo "﬙ $mem"
}

vol(){
	vol=$(pamixer --get-volume-human)
	mod=$(pamixer --get-volume-human | cut -d '%' -f1)
	if [ "$vol" = muted ] || [ "$vol" = "0%" ]; then echo "婢 $vol"
	elif [ "$mod" -gt 0 ] && [ "$mod" -lt 25 ]; then echo "奄 $vol"
	elif [ "$mod" -gt 24 ] && [ "$mod" -lt 50 ]; then echo "奔 $vol"
	else echo "墳 $vol"
	fi
}

while true; do
	xsetroot -name " [$(mem)] [$(vol)] [$(dte)] [$(tme)]"
	sleep 1s
done &
