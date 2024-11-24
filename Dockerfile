FROM ubuntu:24.04

RUN \
  apt-get update && \
  apt-get -y install wget bzip2 && \
  wget https://downloads.getmonero.org/cli/monero-linux-x64-v0.18.3.4.tar.bz2 -O /monero.tar.bz2 && \
  tar -xjvf monero.tar.bz2 && \
  mkdir /monerod && \
  mv /$(ls -1 / | grep monero-x86_64)/* /monerod/ && \
  rm -Rf /$(ls -1 / | grep monero-x86_64) && \
  rm /monero.tar.bz2 && \
  apt-get clean

CMD ["/monerod/monerod", "--data-dir", "/bitmonero", "--log-file", "/bitmonero/bitmonero.log", "--non-interactive"]
