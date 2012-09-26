#!/bin/bash

#set -e

# cd /tmp
# PPREL=puppetlabs-release
# PPDEB=$PPREL-squeeze.deb

# # make sure to overwrite
# wget -N http://apt.puppetlabs.com/$PPDEB

# # list information about the deb that we downloaded, and steal the version
# DEBV=`dpkg -I $PPDEB | grep Version | awk '{ print $2 }'`

# # list the release package info from the system and strip the result
# # if the status isn't "ii" (installed)
# INSTALLV=`dpkg -l $PPREL | grep "^ii" | awk '{ print $3 }'`

# # if the package version and the version listing (installed)
# # are the same, skip the update and isntall of the puppet packages
# if [ $DEBV = $INSTALLV ]; then
#   exit 0;
# fi

# # install the puppet release for squeeze
# sudo dpkg -i $PPDEB

# # update to latest puppet
sudo apt-get update

# update puppet install
# update facter to make sure the osfamily value is set properly
sudo apt-get -yq install facter puppet
