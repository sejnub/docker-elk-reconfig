#!/bin/bash

# https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html
sudo sysctl -w vm.max_map_count=262144

BRANCH=develop

clear

# Checkout docker-elk-reconfig and cache git login

cd ~
rm -rf ~/docker-elk-reconfig
git clone https://github.com/sejnub/docker-elk-reconfig.git

# Do everything

cd ~
cd ~/docker-elk-reconfig/reconfig
git checkout $BRANCH
./start.sh

