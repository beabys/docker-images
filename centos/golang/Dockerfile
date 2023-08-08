ARG CENTOS_VERSION=7
ARG GOLANG_VERSION=1.17.13
FROM beabys/centos${CENTOS_VERSION}_git as beabys_centos_base

FROM beabys_centos_base AS base-amd64-1.20.7
ARG GOLANG_VERSION=$GOLANG_VERSION
ARG GOLANG_DOWNLOAD_URL=https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ARG GOLANG_DOWNLOAD_SHA256=f0a87f1bcae91c4b69f8dc2bc6d7e6bfcd7524fceec130af525058c0c17b1b44
FROM beabys_centos_base AS base-amd64-1.19.9
ARG GOLANG_VERSION=$GOLANG_VERSION
ARG GOLANG_DOWNLOAD_URL=https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ARG GOLANG_DOWNLOAD_SHA256=e858173b489ec1ddbe2374894f52f53e748feed09dde61be5b4b4ba2d73ef34b
FROM beabys_centos_base AS base-amd64-1.18.4
ARG GOLANG_VERSION=$GOLANG_VERSION
ARG GOLANG_DOWNLOAD_URL=https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ARG GOLANG_DOWNLOAD_SHA256=c9b099b68d93f5c5c8a8844a89f8db07eaa58270e3a1e01804f17f4cf8df02f5
FROM beabys_centos_base AS base-amd64-1.17.13

FROM beabys_centos_base AS base-arm64-1.20.7
ARG GOLANG_VERSION=$GOLANG_VERSION
ARG GOLANG_DOWNLOAD_URL=https://golang.org/dl/go$GOLANG_VERSION.linux-arm64.tar.gz
ARG GOLANG_DOWNLOAD_SHA256=44781ae3b153c3b07651d93b6bc554e835a36e2d72a696281c1e4dad9efffe43
FROM beabys_centos_base AS base-arm64-1.19.9
ARG GOLANG_VERSION=$GOLANG_VERSION
ARG GOLANG_DOWNLOAD_URL=https://golang.org/dl/go$GOLANG_VERSION.linux-arm64.tar.gz
ARG GOLANG_DOWNLOAD_SHA256=b947e457be9d7b52a082c68e42b6939f9cc151f1ad5b3d8fd646ca3352f6f2f1
FROM beabys_centos_base AS base-arm64-1.18.4
ARG GOLANG_VERSION=$GOLANG_VERSION
ENV GOLANG_DOWNLOAD_URL=https://golang.org/dl/go$GOLANG_VERSION.linux-arm64.tar.gz
ENV GOLANG_DOWNLOAD_SHA256=35014d92b50d97da41dade965df7ebeb9a715da600206aa59ce1b2d05527421f
FROM beabys_centos_base AS base-arm64-1.17.13
ARG GOLANG_VERSION=$GOLANG_VERSION
ENV GOLANG_DOWNLOAD_URL=https://golang.org/dl/go$GOLANG_VERSION.linux-arm64.tar.gz
ENV GOLANG_DOWNLOAD_SHA256=914daad3f011cc2014dea799bb7490442677e4ad6de0b2ac3ded6cee7e3f493d


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