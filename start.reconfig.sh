#!/bin/bash

# This script starts the elk stack with the config this repository.

# Stop everything

cd ~
cd ~/docker-elk
docker-compose down

# Checkout docker-elk

cd ~
rm -rf ~/docker-elk
git clone https://github.com/sejnub/docker-elk.git

# Apply docker-elk-reconfig

cd ~
cd ~/docker-elk-reconfig
./apply.reconfig.sh

# Start docker-elk

cd ~/docker-elk
docker-compose up -d
