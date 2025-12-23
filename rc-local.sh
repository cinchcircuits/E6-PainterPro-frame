#!/bin/sh
## Copy this script to your /etc/rc.local set chmod 755 on it.

user="mgregg"

# Sleep while we wait for wifi, etc to come up
sleep 60
/bin/su -s /bin/bash -c "/home/$user/E6-PainterPro-frame/run-the-thing.bash" $user
/bin/bash /home/$user/E6-PainterPro-frame/restart-script.bash

