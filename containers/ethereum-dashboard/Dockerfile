### builder
FROM alpine:edge as builder

RUN apk add --no-cache \
  git \
  nodejs \
  npm

RUN npm install -g \
    pm2 \
    grunt-cli

WORKDIR /dashboard-app

### download eth-net-intelligence and install its resource packages
RUN git clone https://github.com/cubedro/eth-net-intelligence-api && \
    cd eth-net-intelligence-api && \
    npm install

### download eth-netstats and build it
RUN git clone https://github.com/cubedro/eth-netstats && \
    cd eth-netstats && \
    npm install && \
    grunt

### Ethereum Dashboard
FROM alpine:edge

COPY --from=fstnetwork/parity-ethereum:v2.3.3 /usr/bin/parity /usr/bin/parity
COPY --from=fstnetwork/go-ethereum:v1.8.21 /usr/bin/geth /usr/bin/geth
COPY --from=fstnetwork/azure-ethereum-launcher:v0.1.1 /usr/bin/ethereum-launcher /usr/bin/ethereum-launcher
COPY --from=builder /dashboard-app /dashboard-app

RUN apk add --no-cache \
  libstdc++ \
  openssl \
  eudev-libs \
  libgcc \
  libusb \
  nodejs \
  npm && \
  npm install -g pm2

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
