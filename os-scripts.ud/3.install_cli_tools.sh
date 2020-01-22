#!/bin/bash
export DEBIAN_FRONTEND=noninteractive ;

apt-get update

# install curl to fix broken wget while retrieving content from secured sites
apt-get -yq install curl jq
