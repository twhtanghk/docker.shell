FROM debian:unstable

RUN apt-get update \
&&  apt-get install -y nfs-ganesha nfs-ganesha-vfs nfs-ganesha-proxy \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/* \
&&  mkdir /var/run/dbus /exports

EXPOSE 2049 38465-38467 662 111/udp 111

ADD start.sh /

CMD ["/start.sh"]
