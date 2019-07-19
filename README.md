# ycash-docker
Dockerfile for ycash


# Building

```bash
docker build -t ycash .
```

# Running

Customize config file `coin.conf` first.

```bash
# block dir
mkdir -p data/{block,zcash-params}
# first time running
docker run --rm -it -v `pwd`/data/zcash-params:/root/.zcash-params --entrypoint /opt/coin/fetch-params.sh ycash
# later
docker run --rm -itd --name iyec -p 8832:8832 -v `pwd`/data/zcash-params:/root/.zcash-params -v `pwd`/data/block:/opt/coin/data -v `pwd`/coin.conf:/opt/coin/coin.conf ycash
```

# Using pre-built docker image

```bash
docker run --rm -itd --name iyec -p 8832:8832 -v `pwd`/data/zcash-params:/root/.zcash-params -v `pwd`/data/block:/opt/coin/data -v `pwd`/coin.conf:/opt/coin/coin.conf mixhq/ycash
```
