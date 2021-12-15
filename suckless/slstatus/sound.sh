#!/bin/bash
snd="$(pamixer --get-volume)"
if [$snd -eq 0]
then
  echo -e "婢 mute"
elif [$snd -gt 0 && $snd -lt 25]
then 
  echo -e "奄 $snd%"
elif [$snd -gt 24 && -lt 51;]
then
  echo -e "奔 $snd%"
else
  echo -e "墳 $snd%"
fi
