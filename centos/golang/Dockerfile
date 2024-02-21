ARG CENTOS_VERSION=7
ARG GOLANG_VERSION=1.17.13
FROM beabys/centos${CENTOS_VERSION}_git as beabys_centos_base

FROM beabys_centos_base AS base-amd64-1.22.0
ARG GOLANG_VERSION=$GOLANG_VERSION
ARG GOLANG_DOWNLOAD_URL=https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ARG GOLANG_DOWNLOAD_SHA256=f6c8a87aa03b92c4b0bf3d558e28ea03006eb29db78917daec5cfb6ec1046265
FROM beabys_centos_base AS base-amd64-1.21.0
ARG GOLANG_VERSION=$GOLANG_VERSION
ARG GOLANG_DOWNLOAD_URL=https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ARG GOLANG_DOWNLOAD_SHA256=d0398903a16ba2232b389fb31032ddf57cac34efda306a0eebac34f0965a0742
FROM beabys_centos_base AS base-amd64-1.20.7
ARG GOLANG_VERSION=$GOLANG_VERSION
ARG GOLANG_DOWNLOAD_URL=https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ARG GOLANG_DOWNLOAD_SHA256=f0a87f1bcae91c4b69f8dc2bc6d7e6bfcd7524fceec130af525058c0c17b1b44

FROM beabys_centos_base AS base-arm64-1.22.0
ARG GOLANG_VERSION=$GOLANG_VERSION
ARG GOLANG_DOWNLOAD_URL=https://golang.org/dl/go$GOLANG_VERSION.linux-arm64.tar.gz
ARG GOLANG_DOWNLOAD_SHA256=6a63fef0e050146f275bf02a0896badfe77c11b6f05499bb647e7bd613a45a10
FROM beabys_centos_base AS base-arm64-1.21.0
ARG GOLANG_VERSION=$GOLANG_VERSION
ARG GOLANG_DOWNLOAD_URL=https://golang.org/dl/go$GOLANG_VERSION.linux-arm64.tar.gz
ARG GOLANG_DOWNLOAD_SHA256=f3d4548edf9b22f26bbd49720350bbfe59d75b7090a1a2bff1afad8214febaf3
FROM beabys_centos_base AS base-arm64-1.20.7
ARG GOLANG_VERSION=$GOLANG_VERSION
ARG GOLANG_DOWNLOAD_URL=https://golang.org/dl/go$GOLANG_VERSION.linux-arm64.tar.gz
ARG GOLANG_DOWNLOAD_SHA256=44781ae3b153c3b07651d93b6bc554e835a36e2d72a696281c1e4dad9efffe43

#install dependencies
FROM base-$TARGETARCH-$GOLANG_VERSION

RUN yum update -y

# install go
RUN curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
  && echo "$GOLANG_DOWNLOAD_SHA256 golang.tar.gz" | sha256sum -c - \
  && tar -C /usr/local -xzf golang.tar.gz \
  && rm golang.tar.gz

ENV PATH /go/bin:/usr/local/go/bin:$PATH

RUN echo "export PATH=$PATH" >> /root/.bashrc && \
  source /root/.bashrc

# prepare go-env
RUN mkdir -p "/go/src" "/go/bin" "/go/pkg" && chmod -R 777 "/go"