#!/bin/bash
arg="$1"

device_path="/sys/class/backlight/acpi_video0"

current_brightness=$(cat $device_path/brightness)
max_brightness=$(cat $device_path/max_brightness)

new_brightness=$current_brightness
if [ $arg = "up" ]; then
  new_brightness=$((new_brightness + 5))
elif [ $arg = "down" ]; then
  new_brightness=$((new_brightness - 5))
else
  exit 1
fi

if [ $new_brightness -gt $max_brightness ]; then
  new_brightness=$max_brightness
elif [ $new_brightness -lt 5 ]; then
  new_brightness=5
fi

echo $new_brightness > $device_path/brightness