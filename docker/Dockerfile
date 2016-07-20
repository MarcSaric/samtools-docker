FROM ubuntu:16.04

MAINTAINER Jeremiah H. Savage <jeremiahsavage@gmail.com>

ENV samtools_docker 0.1

USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --force-yes \
    bzip2 \
    gcc \
    libncurses-dev \
    sudo \
    wget

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://github.com/samtools/samtools/releases/download/1.3.1/samtools-1.3.1.tar.bz2 \
    && tar xf samtools-1.3.1.tar.bz2 \
    && cd samtools-1.3.1 \
    && ./configure --prefix=/usr/local \
    && make \
    && make install

RUN adduser --disabled-password --gecos '' ubuntu && adduser ubuntu sudo && echo "ubuntu	ALL=(ALL)	NOPASSWD:ALL" >> /etc/sudoers.d/ubuntu

USER ubuntu

ENV HOME /home/ubuntu

WORKDIR ${HOME}
