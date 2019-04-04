FROM ubuntu:disco-20190310

MAINTAINER Jeremiah H. Savage <jeremiahsavage@gmail.com>

RUN apt-get update \
    && apt-get dist-upgrade -y \
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
    && wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 \
    && tar xf samtools-1.9.tar.bz2 \
    && cd samtools-1.9 \
    && ./configure --prefix=/usr/local \
    && make \
    && make install \
    && cd - \
    && rm -rf samtools-1.9* \
    && apt-get remove --purge -y \
        bzip2 \
        gcc \
        libbz2-dev \
        liblzma-dev \
        libncurses-dev \
        make \
        wget \
        zlib1g-dev \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
