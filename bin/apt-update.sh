#!/bin/bash

if test -f /etc/apt-update-once; then
	exit;
fi

sudo apt-get update

sudo touch /etc/apt-update-once
# sudo apt-get -yq upgrade
