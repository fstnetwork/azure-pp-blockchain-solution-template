## builder
FROM alpine:edge AS builder

# show backtraces
ENV RUST_BACKTRACE 1

RUN apk add --update --no-cache \
  git \
  build-base \
  cargo \
  cmake \
  eudev-dev \
  linux-headers \
  perl \
  rust

RUN git clone --branch v2.2.7 https://github.com/paritytech/parity-ethereum

WORKDIR /parity-ethereum

# show current version of cargo and rustc
RUN cargo version && rustc --version

# build with release mode
RUN cargo build --release --target x86_64-alpine-linux-musl --verbose

# copy binary to /usr/bin
RUN cp target/x86_64-alpine-linux-musl/release/parity /usr/bin/parity

# show parity --version
RUN file /usr/bin/parity && /usr/bin/parity --version

## Parity-Ethereum
FROM alpine:edge

# show backtraces
ENV RUST_BACKTRACE 1

RUN apk add --no-cache \
  libstdc++ \
  eudev-libs \
  libgcc

COPY --from=builder /usr/bin/parity /usr/bin/parity

ENTRYPOINT [ "parity" ]
