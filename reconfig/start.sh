#!/bin/bash

# This script starts the elk stack with the config this repository.

# Stop everything

echo "#### start.sh has started."

cd ~
cd ~/docker-elk
docker-compose down

# Checkout docker-elk

cd ~
rm -rf ~/docker-elk
git clone https://github.com/deviantony/docker-elk.git

# Apply docker-elk-reconfig

cd ~
cd ~/docker-elk-reconfig/reconfig
./apply.sh

# Start docker-elk

cd ~/docker-elk

#docker-compose up -d

docker-compose \
  -f docker-compose.yml \
  -f extensions/curator/curator-compose.yml \
  -f extensions/logspout/logspout-compose.yml \
  up -d

echo "#### start.sh has ended."
