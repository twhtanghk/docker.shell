#!/bin/bash

DEBIAN_FRONTEND=noninteractive
CUSER=postgres
CUID=$(id -u ${CUSER})
CGID=$(id -g ${CUSER})
SRC=${HOST}:/data/postgres
DST=${PGDATA}

apt-get update
apt-get install -y sshfs
echo ${SSHFS_PASS} | sshfs -o allow_other -o uid=${CUID} -o gid=${CGID} -o StrictHostKeyChecking=no -o password_stdin ${SRC} ${DST}

/docker-entrypoint.sh $@
