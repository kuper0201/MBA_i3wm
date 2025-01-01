#!/bin/bash
arg="$1"

# Path to the keyboard backlight directory (change if different in your system)
device_path="/sys/class/leds/smc::kbd_backlight"

# Get current brightness and max brightness (keyboard backlight)
current_brightness=$(cat $device_path/brightness)
max_brightness=$(cat $device_path/max_brightness)

# Determine the new brightness based on the argument
new_brightness=$current_brightness
if [ "$arg" = "up" ]; then
  new_brightness=$((new_brightness + 1))
elif [ "$arg" = "down" ]; then
  new_brightness=$((new_brightness - 1))
else
  exit 1
fi

# Ensure the new brightness is within valid bounds
if [ $new_brightness -gt $max_brightness ]; then
  new_brightness=$max_brightness
elif [ $new_brightness -lt 0 ]; then
  new_brightness=0
fi

# Set the new keyboard backlight brightness
echo $new_brightness > $device_path/brightness
