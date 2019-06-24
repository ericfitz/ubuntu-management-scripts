#!/bin/bash

# update package lists and upgrade
echo Updating packages...
dpkg --configure -a
apt-get update -qy
DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -qfy

# reboot if required
test -f /var/run/reboot-required && echo Rebooting to activate updates... && reboot now

# clean up old stuff so we don't run out of space
echo Cleaning up...
yes | apt-get autoremove -q -y
yes | apt-get clean
yes | apt-get autoclean
purge-old-kernels

