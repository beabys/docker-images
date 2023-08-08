ARG CENTOS_VERSION=7
ARG GIT_VERSION=2.33.0


FROM centos:$CENTOS_VERSION as centos_base_7
#install dependencies
RUN yum clean all && rm -rf /var/cache/yum/*
RUN yum update -y && yum install -y epel-release

FROM centos:$CENTOS_VERSION as centos_base_8
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y && yum install -y epel-release

FROM centos_base_$CENTOS_VERSION
RUN yum install -y tar openssl-devel make gcc gcc-c++ patch zlib zlib-devel  \
  cmake libxml2-devel libxslt-devel curl rpm-build bzip2 autoconf automake libtool wget \
  nano curl-devel expat-devel gettext-devel perl-ExtUtils-MakeMaker openssh-clients

## install Git
ARG GIT_VERSION=$GIT_VERSION
RUN yum -y remove git
RUN cd /usr/src && \
  wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-${GIT_VERSION}.tar.gz && \
  tar xzf git-${GIT_VERSION}.tar.gz && \
  cd git-${GIT_VERSION} && \
  make prefix=/usr/local/git all && \
  make prefix=/usr/local/git install

ENV PATH /usr/local/git/bin:$PATH

RUN cd /usr/src && \
  rm -rf /usr/src/git-$GIT_VERSION && \
  rm -rf /usr/src/git-$GIT_VERSION.tar.gz
