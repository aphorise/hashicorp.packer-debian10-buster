#!/bin/bash
export DEBIAN_FRONTEND=noninteractive ;

# Clean up
apt-get -yq --purge remove linux-headers-$(uname -r) build-essential
apt-get -yq --purge autoremove
apt-get -yq purge $(dpkg --list |grep '^rc' |awk '{print $2}')
apt-get -yq purge $(dpkg --list |egrep 'linux-image-[0-9]' |awk '{print $3,$2}' |sort -nr |tail -n +2 |grep -v $(uname -r) |awk '{ print $2}')
apt-get -yq clean

# Remove history file
unset HISTFILE

# sync data to disk (fix packer)
sync
