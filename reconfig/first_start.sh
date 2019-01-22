#!/bin/bash


DEFAULT_BRANCH=develop

echo "#### first_start.sh has started."

if [ $# -gt 0 ]; then
  DOCKER_ELK_RECONFIG_BRANCH=$1
  echo "first_start was called with the branch parameter '$DOCKER_ELK_RECONFIG_BRANCH'. So I will use that."
else
  echo "first_start was called without a branch parameter."
  if [ -z "$DOCKER_ELK_RECONFIG_BRANCH" ]; then
    DOCKER_ELK_RECONFIG_BRANCH=$DEFAULT_BRANCH
    echo "I am setting the default branch of docker-elk-reconfig to '$DOCKER_ELK_RECONFIG_BRANCH'."
  else
    echo "You set the default branch of docker-elk-reconfig to '$DOCKER_ELK_RECONFIG_BRANCH'. So I use that."
  fi
fi


echo "Cloning the branch '$DOCKER_ELK_RECONFIG_BRANCH' of docker-elk-reconfig."

# https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html
sudo sysctl -w vm.max_map_count=262144

# Checkout docker-elk-reconfig and cache git login
cd ~
rm -rf ~/docker-elk-reconfig
git clone https://github.com/sejnub/docker-elk-reconfig.git

# Do everything
cd ~/docker-elk-reconfig/reconfig
git checkout $DOCKER_ELK_RECONFIG_BRANCH
cd ~
cd ~/docker-elk-reconfig/reconfig
./stop-clone-apply-start-wait-init.sh

echo "#### first_start.sh has ended."
