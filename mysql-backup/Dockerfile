FROM mariadb

WORKDIR /root

ENV SRC https://raw.githubusercontent.com/twhtanghk/docker.shell/master/mysql-backup
ADD $SRC/entrypoint.sh /root
ADD $SRC/lib.sh /root

RUN apt-get update \
&&  apt-get install -y sshfs logrotate cron \
&&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ENTRYPOINT /root/entrypoint.sh
