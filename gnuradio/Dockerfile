FROM debian:jessie

RUN apt-get update \
&&  apt-get install -d -y git gnuradio gnuradio-dev \
&&  dpkg --unpack /var/cache/apt/archives/uhd-host*.deb \
&&  sed 's/^/#/g' < /etc/sysctl.d/uhd-usrp2.conf.dpkg-new > /tmp/a \
&&  mv /tmp/a /etc/sysctl.d/uhd-usrp2.conf.dpkg-new \
&&  apt-get install -f -y \
&&  rm -rf /var/lib/apt/lists/*
