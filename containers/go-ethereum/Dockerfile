## builder
FROM alpine:edge AS builder

RUN apk add --update \
  go \
  git \
  make \
  gcc \
  musl-dev \
  linux-headers \
  ca-certificates

RUN git clone --depth 1 --branch v1.8.21 https://github.com/ethereum/go-ethereum && \
  (cd go-ethereum && make geth) && \
  cp go-ethereum/build/bin/geth /usr/bin/geth


FROM alpine:edge

COPY --from=builder /usr/bin/geth /usr/bin/geth

ENTRYPOINT [ "geth" ]
