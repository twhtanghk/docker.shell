FROM ubuntu:latest

RUN apt-get update \
&&  apt-get install -y software-properties-common \
&&  add-apt-repository --yes ppa:opencpn/opencpn \
&&  apt-get update \
&&  apt-get install -y opencpn \
&&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

CMD /usr/bin/opencpn
