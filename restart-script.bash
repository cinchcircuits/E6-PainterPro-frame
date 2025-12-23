#!/bin/sh
/usr/bin/sleep 600
if [ ! -f /dev/shm/noreboot ]; then
	/usr/sbin/shutdown -h now
fi

