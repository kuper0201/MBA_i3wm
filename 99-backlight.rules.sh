ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="acpi_video0", RUN+="/bin/chmod 0666 /sys/class/backlight/%k/brightness"