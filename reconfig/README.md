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


## Enable more extensions

### Enable APM

- Search for apm in all files of this rep and change those places cleverly
- add apm to docker-compose up in start.sh
- Check if 

## Run it


```sh

curl https://raw.githubusercontent.com/sejnub/docker-elk-reconfig/develop/reconfig/first_start.sh | bash

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
