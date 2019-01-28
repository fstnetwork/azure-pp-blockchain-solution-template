FROM alpine:edge

# show backtraces
ENV RUST_BACKTRACE 1

RUN apk add --no-cache \
  libstdc++ \
  openssl \
  eudev-libs \
  libgcc \
  libusb

COPY --from=fstnetwork/parity-ethereum:v2.2.7 /usr/bin/parity /usr/bin/parity
COPY --from=fstnetwork/go-ethereum:v1.8.21 /usr/bin/geth /usr/bin/geth
COPY --from=fstnetwork/azure-ethereum-launcher:v0.1.0 /usr/bin/ethereum-launcher /usr/bin/ethereum-launcher

ENV RUST_LOG=info

ENTRYPOINT [ "ethereum-launcher" ]
