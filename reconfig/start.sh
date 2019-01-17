#!/bin/bash

BRANCH=master


# This script starts the elk stack with the config this repository.

# Stop everything

echo "#### start.sh has started."

cd ~
cd ~/docker-elk
docker-compose down --remove-orphans


# Checkout docker-elk

cd ~
rm -rf ~/docker-elk
git clone https://github.com/sejnub/docker-elk.git
cd ~/docker-elk
git checkout $BRANCH

# Apply docker-elk-reconfig

cd ~
cd ~/docker-elk-reconfig/reconfig
./apply.sh

# Start docker-elk

cd ~/docker-elk

docker-compose \
  -f docker-compose.yml \
  -f extensions/curator/curator-compose.yml \
  -f extensions/logspout/logspout-compose.yml \
  up -d

echo "#### start.sh has ended."
