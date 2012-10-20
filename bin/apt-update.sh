#!/bin/bash

if test -f /var/lock/apt-update-once; then
	exit;
fi

sudo apt-get update

touch /var/lock/apt-update-once
# sudo apt-get -yq upgrade
