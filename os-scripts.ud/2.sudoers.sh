#!/bin/bash
export DEBIAN_FRONTEND=noninteractive ;

apt-get -yq install sudo

# Set up password-less sudo for user vagrant
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/vagrant
chmod 440 /etc/sudoers.d/vagrant

# no tty
echo "Defaults !requiretty" >> /etc/sudoers
