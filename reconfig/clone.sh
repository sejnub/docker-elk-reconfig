#!/bin/bash

DOCKER_ELK_BRANCH=x-pack


echo "#### clone.sh has started."

if [ $# -gt 0 ]; then
  DOCKER_ELK_BRANCH=$1  
  echo "Clone was called with the parameter '$DOCKER_ELK_BRANCH'. Using that as the branch of docker-elk."
else
  echo "Clone was called without a branch parameter. Taking taking the default: '$DOCKER_ELK_BRANCH'"
fi

# Checkout docker-elk
cd ~
rm -rf ~/docker-elk
git clone https://github.com/sejnub/docker-elk.git
cd ~/docker-elk
git checkout $DOCKER_ELK_BRANCH


echo "#### clone.sh has ended."
