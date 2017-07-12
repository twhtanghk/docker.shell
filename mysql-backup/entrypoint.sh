#!/bin/bash

printenv |grep '^DB' |sed 's/^/export /g' >./env.sh

. ./lib.sh

mountEncfs ${ENCHOST}:/data/backup /mnt
chown root.root /etc/logrotate.conf
chown root.crontab /var/spool/cron/crontabs/root
cron -f -L 15
