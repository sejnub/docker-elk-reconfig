#!/bin/bash

echo "#### start.sh has started."

cd ~/docker-elk

# add --build to check for new Dockerfiles
docker-compose \
  -f docker-compose.yml \
  -f extensions/curator/curator-compose.yml \
  -f extensions/cerebro/cerebro-compose.yml \
  -f extensions/elastichq/elastichq-compose.yml \
  -f extensions/logspout/logspout-compose.yml \
  up -d



export HOSTNAME=$(hostname)
echo "HOSTNAME='$HOSTNAME'"

docker-compose \
  -f extensions/portainer/portainer-compose.yml \
  up -d

echo "#### start.sh has ended."
