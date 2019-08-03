FROM debian

WORKDIR /root

RUN apt-get update \
&&  apt-get install -y rclone encfs rsync fuse \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*
