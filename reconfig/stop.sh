#!/bin/bash


# Stop everything

echo "#### stop.sh has started."

cd ~
cd ~/docker-elk
docker-compose down --remove-orphans

echo "#### stop.sh has ended."
