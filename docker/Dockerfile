FROM quay.io/jeremiahsavage/cdis_base

ENV samtools_docker 0.1

MAINTAINER Jeremiah H. Savage <jeremiahsavage@gmail.com>

USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --force-yes \
    libncurses-dev \
    wget

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER ubuntu

ENV HOME /home/ubuntu

RUN mkdir ${HOME}/tools

WORKDIR ${HOME}/tools/

RUN wget https://github.com/samtools/samtools/releases/download/1.3.1/samtools-1.3.1.tar.bz2 \
    && tar xf samtools-1.3.1.tar.bz2 \
    && cd samtools-1.3.1 \
    && ./configure --prefix=${HOME}/.local \
    && make \
    && make install

WORKDIR ${HOME}
