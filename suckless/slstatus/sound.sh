#!/bin/bash
snd="$(pamixer --get-volume)"
if $snd == 0;
then
  echo -e "婢 mute"
elif $snd > 0 && $snd < 25;
then 
  echo -e "奄 $snd%"
elif $snd >= 25 && <= 50;
then
  echo -e "奔 $snd%"
else
  echo -e "墳 $snd%"
fi
