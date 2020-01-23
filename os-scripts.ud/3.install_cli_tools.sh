#!/bin/bash
export DEBIAN_FRONTEND=noninteractive ;
set -eu ; # abort this script when a command fails or an unset variable is used.
#set -x ; # echo all the executed commands.

apt-get update ;

# install curl to fix broken wget while retrieving content from secured sites
apt-get -yq install curl jq ;
