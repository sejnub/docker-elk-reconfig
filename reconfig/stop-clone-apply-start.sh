#!/bin/bash

# This script starts the elk stack with the config this repository.

DOCKER_ELK_BRANCH=x-pack

echo "#### stop-clone-apply-start.sh has started."

cd ~; cd ~/docker-elk-reconfig/reconfig

# Stop everything
./stop

# Checkout docker-elk
./clone $DOCKER_ELK_BRANCH

# Apply docker-elk-reconfig
./apply.sh

# Start docker-elk
./start.sh

echo "#### stop-clone-apply-start.sh has ended."
