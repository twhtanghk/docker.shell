#!/bin/bash

DEBIAN_FRONTEND=noninteractive
CUSER=mysql
CUID=$(id -u ${CUSER})
CGID=$(id -g ${CUSER})
SRC=${HOST}:/data/maria
DST=/var/lib/mysql

apt-get update
apt-get install -y sshfs
echo ${SSHFS_PASS} | sshfs -o allow_other -o uid=${CUID} -o gid=${CGID} -o StrictHostKeyChecking=no -o password_stdin ${SRC} ${DST}

/docker-entrypoint.sh $@
