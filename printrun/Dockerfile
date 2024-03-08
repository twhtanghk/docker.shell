FROM debian:unstable

WORKDIR /root

RUN apt-get update \
&&  apt-get install -y socat cura slic3r printrun locales \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/* \
&&  sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
&&  locale-gen \
&&  dpkg-reconfigure --frontend=noninteractive locales

CMD /usr/bin/pronterface
