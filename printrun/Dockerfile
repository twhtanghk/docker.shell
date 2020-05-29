FROM debian:unstable

WORKDIR /root

RUN apt-get update \
&&  apt-get install -y socat cura slic3r printrun \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*

CMD /usr/bin/pronterface
