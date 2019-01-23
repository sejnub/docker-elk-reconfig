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

- Search for apm in all files of this rep and change those places cleverly :)
- add apm to ```docker-compose up``` in start.sh

## Run it

```sh

clear
################################################################################"
################################################################################"
################################################################################"
################################################################################"

curl https://raw.githubusercontent.com/sejnub/docker-elk-reconfig/feature37/reconfig/first_start.sh | bash
cd ~
cd ~/docker-elk-reconfig/reconfig
ls -asl

```

## More tools

- elasticsearch-hq
  - <https://hub.docker.com/r/elastichq/elasticsearch-hq/>
  - docker run -p 5001:5000 elastichq/elasticsearch-hq
- cerebro
  - <https://github.com/lmenezes/cerebro>
  - <https://hub.docker.com/r/yannart/cerebro/>
- curator
