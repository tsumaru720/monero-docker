FROM alpine:3.18.0 

RUN \
  apk add --no-cache gcompat && \
  wget https://downloads.getmonero.org/cli/linux64 -O /monero.tar.bz2 && \
  tar -xjvf monero.tar.bz2 && \
  mkdir /monerod && \
  mv /$(ls -1 / | grep monero-x86_64)/* /monerod/ && \
  rm -Rf /$(ls -1 / | grep monero-x86_64) && \
  rm /monero.tar.bz2

CMD ["/monerod/monerod", "--data-dir", "/bitmonero", "--log-file", "/bitmonero/bitmonero.log", "--non-interactive"]
