#!/bin/sh
if [ ! -f /dev/shm/noreboot ]; then
	/usr/bin/sleep 600
	/usr/bin/logger -i e-ink 'restarting'
	/usr/sbin/shutdown -h now
else
	/usr/bin/logger -i e-ink 'noreboot exists, not restarting'
fi

