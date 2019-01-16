# Elastic stack (ELK) on Docker

## HB

```sh

cd ~
cd ~/docker-elk
docker-compose down

cd ~
rm -rf ~/docker-elk
git clone https://github.com/sejnub/docker-elk.git

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
