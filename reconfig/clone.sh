#!/bin/bash

DOCKER_ELK_BRANCH=x-pack


echo "#### clone.sh has started."

if [ $# -gt 0 ]; then
  echo "Clone was called without a branch parameter. Taking taking the default: '$DOCKER_ELK_BRANCH'"
else
  DOCKER_ELK_BRANCH=$1  
  echo "Cloning the branch '$DOCKER_ELK_BRANCH' of docker-elk."
fi

# Checkout docker-elk
cd ~
rm -rf ~/docker-elk
git clone https://github.com/sejnub/docker-elk.git
cd ~/docker-elk
git checkout $DOCKER_ELK_BRANCH


echo "#### clone.sh has ended."
