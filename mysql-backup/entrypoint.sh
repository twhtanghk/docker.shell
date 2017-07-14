#!/bin/bash

printenv |grep '^DB' |sed 's/^/export /g' >./env.sh
chown root.root /etc/logrotate.conf
chown root.crontab /var/spool/cron/crontabs/root
chmod 600 /var/spool/cron/crontabs/root

. ./lib.sh

mountEncfs ${ENCHOST}:/data/backup/mysql /mnt && \
cron -f
