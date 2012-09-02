#!/bin/bash

# Do an initial update of packages.
sudo apt-get update

# Install pwgen so that passwords can be generated for mysql et. all
sudo apt-get -yq install pwgen