#!/bin/sh
function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run nitrogen --restore
run picom --experimental-backends --vsync
run dunst
