#!/bin/bash

DEBIAN_FRONTEND=noninteractive
CUSER=mongodb
CUID=$(id -u ${CUSER})
CGID=$(id -g ${CUSER})
SRC=${HOST}:/data/mongo
DST=/data/db

apt-get update
apt-get install -y sshfs
echo ${SSHFS_PASS} | sshfs -o allow_other -o uid=${CUID} -o gid=${CGID} -o StrictHostKeyChecking=no -o password_stdin ${SRC} ${DST}

/entrypoint.sh $@
