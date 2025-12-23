# E6-PainterPro-frame
My code for a functional 7.3inch E6 Full Color E-Paper for my mom :)

# Installlation

- copy rc-local.sh to /etc/rc.local
- chmod 755 /etc/rc.local
- create /etc/ink-user.txt, add one line with the user the scripts are to run as  
- create /etc/cifs-sourcs.txt, add one line that is the mountpoint to pull files from
- edit /etc/fstab and add a line for the path you put in /etc/cifs-sourcs.txt
- if you are using cifs, add needed creds to /home/-user-/.smbcredentials
- sudo apt install arduino strace tcpdump iptraf-ng openssh-server git make build-essential gpiod libgpiod-dev python3-pip python3-pil python3-numpy spidev python3-spidev python3-gpiozero imagemagick mlocate cmake python3-dev python3-venv python3-pip git-lfs libopencv-dev  python3-opencv i2c-tools cifs-utils

# Arduino installation
A 3.3 volt arduino pro mini is installed in the case, setup to power back on the RPi after a set time. 
- DTR to GPIO16
- RX to GPIO14 (TX)
- TX to GPIO15 (RX)
- GND to GND
- VCC to 3.3V
- IO4 to GPIO3 (power on, and SCL)

# External Documentation
- [http://www.waveshare.com/wiki/RPi_Zero_PhotoPainter#FAQ]
- [http://andreas-mausch.de/blog/2024-11-10-waveshare-photoframe-epaper/]
- [http://ethertubes.com/raspberry-pi-rts-cts-flow-control/]
- [http://pinout.xyz/]
