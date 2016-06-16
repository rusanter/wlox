# bitcoind
FROM bitcoind:0.2
MAINTAINER David Rodriguez <david@goldenfrogtech.com>

ENV TESTNET 1

USER root
ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*


USER test

CMD ["run.sh"]
