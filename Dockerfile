FROM ubuntu:artful-20171019

MAINTAINER Jeremiah H. Savage <jeremiahsavage@gmail.com>

RUN apt-get update \
    && apt-get install -y \
       bzip2 \
       gcc \
       libbz2-dev \
       liblzma-dev \
       libncurses-dev \
       make \
       wget \
       zlib1g-dev \
    && apt-get clean \
    && wget https://github.com/samtools/samtools/releases/download/1.6/samtools-1.6.tar.bz2 \
    && tar xf samtools-1.6.tar.bz2 \
    && cd samtools-1.6 \
    && ./configure --prefix=/usr/local \
    && make \
    && make install \
    && cd - \
    && rm -rf samtools-1.6* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*