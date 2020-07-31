FROM quay.io/ncigdc/bio-u18:latest

MAINTAINER Charles Czysz <czysz@uchicago.edu>

ARG VERSION

ENV SAMTOOLS_URL=https://github.com/samtools/samtools/releases/download/$VERSION/samtools-$VERSION.tar.bz2

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

RUN wget $SAMTOOLS_URL \
    && tar xf samtools-$VERSION.tar.bz2 \
    && cd samtools-$VERSION \
    && ./configure --prefix=/usr/local \
    && make \
    && make install \
    && cd - \
    && rm -rf samtools-$VERSION \
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
