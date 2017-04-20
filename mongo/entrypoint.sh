#!/bin/bash

DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y sshfs
echo ${SSHFS_PASS} | sshfs -o allow_other -o uid=$(id -u mongodb) -o gid=$(id -g mongodb) -o StrictHostKeyChecking=no -o password_stdin ${HOST}:/data/mongo /data/db

/entrypoint.sh $@
