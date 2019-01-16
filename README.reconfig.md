# Elastic stack configuration (ELK) on Docker

## What is this

This repository contains

- one or more specific configurations for the elk stack at <https://github.com/deviantony/docker-elk>

- the tools to add this configuration to a working copy of <https://github.com/deviantony/docker-elk>

## Run it

```sh

# Stop everything

cd ~
cd ~/docker-elk
docker-compose down

# Checkout docker-elk

cd ~
rm -rf ~/docker-elk
git clone https://github.com/sejnub/docker-elk.git

# Checkout docker-elk-reconfig

cd ~
rm -rf ~/docker-elk-reconfig
git clone https://github.com/sejnub/docker-elk-reconfig.git

# Apply docker-elk-reconfig

cd ~
cd ~/docker-elk-reconfig
./apply.reconfig.sh

# Start docker-elk

cd ~/docker-elk
docker-compose up -d

```

### More tools

- elasticsearch-hq
  - <https://hub.docker.com/r/elastichq/elasticsearch-hq/>
  - docker run -p 5001:5000 elastichq/elasticsearch-hq
- cerebro
  - <https://github.com/lmenezes/cerebro>
  - <https://hub.docker.com/r/yannart/cerebro/>
- curator
