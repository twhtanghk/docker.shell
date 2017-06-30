#!/bin/bash

. lib.sh

install sshfs logrotate cron
mount.encfs ${ENCHOST}:/data/backup /mnt
chown root.root /etc/logrotate.conf
chown root.crontab /var/spool/cron/crontabs/root
cron -f
