FROM debian:9

RUN mkdir -p /opt/coin
WORKDIR /opt/coin

EXPOSE 8832

RUN apt update && apt install -y wget libgomp1
RUN wget https://github.com/ycashfoundation/ycash/releases/download/2.0.5/linux-binaries-ycash-v2.0.5.tar.gz -O - | tar --strip-components 1 -C /opt/coin -xzf -
RUN wget https://github.com/zcash/zcash/raw/master/zcutil/fetch-params.sh && chmod +x fetch-params.sh

# cleanup
RUN rm -rf /var/lib/apt/lists/*

VOLUME ["/root/.zcash-params", "/opt/coin/data", "/opt/coin/coin.conf"]

ENTRYPOINT ["/opt/coin/ycashd"]
CMD ["-conf=/opt/coin/coin.conf"]
