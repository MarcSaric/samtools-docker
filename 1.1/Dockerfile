FROM quay.io/ncigdc/bio-alpine:latest AS build

ARG VERSION

ENV SAMTOOLS_URL=http://sourceforge.net/projects/samtools/files/samtools/$VERSION/samtools-$VERSION.tar.bz2

RUN apk add \
	autoconf \
	automake \
	make \
	gcc \
	musl-dev \
	perl \
	zlib-dev \
	bzip2-dev \
	xz-dev \
	wget \
	libressl-dev \
	ncurses-dev

RUN wget $SAMTOOLS_URL \
	&& tar xf samtools-$VERSION.tar.bz2 \
	&& cd samtools-$VERSION \
	&& make \
	&& make install \
	&& cd - \
	&& rm -rf samtools-$VERSION

