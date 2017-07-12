#!/bin/bash

. lib.sh

mountEncfs ${ENCHOST}:/data/backup /mnt
chown root.root /etc/logrotate.conf
chown root.crontab /var/spool/cron/crontabs/root
printenv |grep '^DB' |sed 's/^/export /g' >/root/env.sh
cron -f -L 15
