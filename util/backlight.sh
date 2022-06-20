+#!/bin/bash

set -e
file="/sys/class/backlight/intel_backlight/device/intel_backlight/brightness"
current=$(cat "$file")
new="$current"

if [ "$1" = "-inc" ]
then
	new=$(( current + $5 ))
fi

if [ "$1" = "-dec" ]
then+*
new=$(( current - $5 ))
fi

echo "$new" | tee "$file"
