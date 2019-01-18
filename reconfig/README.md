# Elastic stack configuration (ELK) on Docker

## What is this

This repository contains

- one or more specific configurations for the elk stack at <https://github.com/deviantony/docker-elk>

- the tools to add this configuration to a working copy of <https://github.com/deviantony/docker-elk>

## Links

- kibana optimize task
  - [add command line option to execute the optimize task standalone](https://github.com/elastic/kibana/issues/6057)
  - [How to do custom docker image that has certain features disabled](https://discuss.elastic.co/t/how-to-do-custom-docker-image-that-has-certain-features-disabled/132007/4)
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

## WIP: Save Kibana optimizations

After running the 
```bash

docker commit docker-elk_kibana_1 kibana_optimized

cd ~/docker-elk-reconfig
./stop.sh

docker rm docker-elk_kibana_1
docker rmi docker-elk_kibana:latest
docker tag kibana_optimized docker-elk_kibana:latest

```

## More tools

- elasticsearch-hq
  - <https://hub.docker.com/r/elastichq/elasticsearch-hq/>
  - docker run -p 5001:5000 elastichq/elasticsearch-hq
- cerebro
  - <https://github.com/lmenezes/cerebro>
  - <https://hub.docker.com/r/yannart/cerebro/>
- curator
