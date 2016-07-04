# bitcoind
#amacneil

FROM debian:jessie
MAINTAINER David Rodriguez <david@goldenfrogtech.com>

RUN mkdir -p /app
WORKDIR /app
COPY . /app

#RUN groupadd -r bitcoin && useradd -r -m -g bitcoin bitcoin

ENV BITCOIN_VERSION 0.12.1
ENV BITCOIN_URL https://bitcoin.org/bin/bitcoin-core-$BITCOIN_VERSION/bitcoin-$BITCOIN_VERSION-linux64.tar.gz
ENV BITCOIN_ASC_URL https://bitcoin.org/bin/bitcoin-core-$BITCOIN_VERSION/SHA256SUMS.asc

# install build dependencies
RUN set -ex \
    && apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates wget \
    && rm -rf /var/lib/apt/lists/*

	# grab gosu for easy step-down from root
	#&& gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
	#&& wget -qO /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(dpkg --print-architecture)" \
	#&& wget -qO /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(dpkg --print-architecture).asc" \
	#&& gpg --verify /usr/local/bin/gosu.asc \
	#&& rm /usr/local/bin/gosu.asc \
	#&& chmod +x /usr/local/bin/gosu \

# install bitcoin binaries
RUN BITCOIN_DIST=$(basename $BITCOIN_URL) \
    && wget -O $BITCOIN_DIST $BITCOIN_URL \
    && gpg --keyserver pool.sks-keyservers.net --recv-keys 01EA5486DE18A882D4C2684590C8019E36C2E964 \
    && wget -qO bitcoin.asc $BITCOIN_ASC_URL \
    && gpg --verify bitcoin.asc \
    && tar -xzvf $BITCOIN_DIST -C /usr/local --strip-components=1 --exclude=*-qt \
    && rm bitcoin*

# remove build dependencies
RUN apt-get purge -y --auto-remove wget

# Launch Details
EXPOSE 8332
VOLUME /notify
VOLUME /data

COPY bitcoin.conf /app/bitcoin.conf
CMD bitcoind --conf=/app/bitcoin.conf
