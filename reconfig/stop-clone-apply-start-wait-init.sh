#!/bin/bash

# This script starts the elk stack with the config this repository.

DOCKER_ELK_BRANCH=x-pack

echo "#### stop-clone-apply-start-wait-init.sh has started."

cd ~; cd ~/docker-elk-reconfig/reconfig

# Checkout docker-elk
./clone.sh $DOCKER_ELK_BRANCH

# Apply docker-elk-reconfig
./apply.sh

# Stop everything
./stop.sh

# Start docker-elk
./start.sh

# Wait
/utils/wait-for/wait-for-elasticsearch.sh

# Init Elasticsearch
./init.sh

echo "#### stop-clone-apply-start-wait-init.sh has ended."
