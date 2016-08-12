FROM ubuntu:xenial-20160809

MAINTAINER Jeremiah H. Savage <jeremiahsavage@gmail.com>

RUN apt-get update \
    && apt-get install -y \
       bzip2 \
       gcc \
       libncurses-dev \
       make \
       wget \
       zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && wget https://github.com/samtools/samtools/releases/download/1.3.1/samtools-1.3.1.tar.bz2 \
    && tar xf samtools-1.3.1.tar.bz2 \
    && cd samtools-1.3.1 \
    && ./configure --prefix=/usr/local \
    && make \
    && make install \
    && cd - \
    && rm -rf samtools-1.3.1*