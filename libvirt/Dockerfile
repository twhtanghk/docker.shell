FROM nachinius/c-dev

WORKDIR /root

ENV DEBIAN_FRONTEND=noninteractive \
    LD_LIBRARY_PATH=/usr/local/lib

RUN apt-get update \
&&  apt-get install -y git libtool autoconf autopoint pkg-config libxml2-utils xsltproc gettext python libnl-dev libxml2-dev libdevmapper-dev libpciaccess-dev dnsmasq iptables ebtables pm-utils dmidecode \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/* \
&&  git clone https://github.com/libvirt/libvirt \
&&  cd libvirt \
&&  git clone https://github.com/coreutils/gnulib .gnulib \
&&  ./autogen.sh --no-git --gnulib-srcdir=./.gnulib \
&&  make install \
&&  echo "listen_tls = 0" >>/usr/local/etc/libvirt/libvirtd.conf \
&&  echo "listen_tcp = 1" >>/usr/local/etc/libvirt/libvirtd.conf \
&&  cd /root \
&&  rm -rf libvirt

EXPOSE 16509

VOLUME /sys/fs/cgroup /var/lib/libvirt

CMD libvirtd --listen
