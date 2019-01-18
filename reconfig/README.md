# Elastic stack configuration (ELK) on Docker

## What is this

This repository contains

- one or more specific configurations for the elk stack at <https://github.com/deviantony/docker-elk>

- the tools to add this configuration to a working copy of <https://github.com/deviantony/docker-elk>

## Links

### x-pack

- <https://www.elastic.co/subscriptions>
- <https://www.elastic.co/guide/en/elasticsearch/reference/current/setup-xpack.html>
- <https://www.elastic.co/guide/en/elasticsearch/reference/current/settings-xpack.html>

## Run it

```sh

# https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html
sudo sysctl -w vm.max_map_count=262144

BRANCH=develop

clear

# Checkout docker-elk-reconfig and cache git login

cd ~
rm -rf ~/docker-elk-reconfig
git clone https://github.com/sejnub/docker-elk-reconfig.git

# Do everything

cd ~
cd ~/docker-elk-reconfig/reconfig
git checkout $BRANCH
./start.sh


```



### More tools

- elasticsearch-hq
  - <https://hub.docker.com/r/elastichq/elasticsearch-hq/>
  - docker run -p 5001:5000 elastichq/elasticsearch-hq
- cerebro
  - <https://github.com/lmenezes/cerebro>
  - <https://hub.docker.com/r/yannart/cerebro/>
- curator
