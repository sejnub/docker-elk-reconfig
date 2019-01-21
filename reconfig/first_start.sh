#!/bin/bash

#TODO: Take branch as parameter here!
DOCKER_ELK_RECONFIG_BRANCH=develop


# https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html
sudo sysctl -w vm.max_map_count=262144

# Checkout docker-elk-reconfig and cache git login
cd ~
rm -rf ~/docker-elk-reconfig
git clone https://github.com/sejnub/docker-elk-reconfig.git

# Do everything
cd ~/docker-elk-reconfig/reconfig
git checkout $DOCKER_ELK_RECONFIG_BRANCH
stop-clone-apply-start-wait-init.sh

