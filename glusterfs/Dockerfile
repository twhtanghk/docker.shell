FROM debian

RUN apt-get update \
&&  apt-get install -y glusterfs-server \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*

EXPOSE 111 24007-25000

ENTRYPOINT ["glusterd", "-N"]
