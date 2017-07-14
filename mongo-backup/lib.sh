#!/bin/bash

. ./env.sh

# install debian packages
# e.g.e install sshfs logrotate
install() {
  DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install -y $@
}

# mount remote local
# e.g. mount encfs:/data /mnt
mountEncfs() {
  CUSER=mongodb
  CUID=$(id -u ${CUSER})
  CGID=$(id -g ${CUSER})
  echo ${SSHFS_PASS} | sshfs -o allow_other -o uid=${CUID} -o gid=${CGID} -o StrictHostKeyChecking=no -o password_stdin $1 $2
}

# parse db parameters DBHOST, DBUSER, DBPASS
# and subsititue with appropriate opts
dbparam() {
  DBHOST=${DBHOST:+--host ${DBHOST}}
  DBUSER=${DBUSER:+-u ${DBUSER}}
  DBPASS=${DBPASS:+-p ${DBPASS}}
}

# show databases in mariadb server
db() {
  dbparam
  echo 'show databases' |mongo --quiet --authenticationDatabase admin ${DBHOST} ${DBUSER} ${DBPASS} |awk '{print $1}'
}

# backup database to dir
# e.g. backup dbname /mnt
backup() {
  dbparam
  mongodump --authenticationDatabase admin ${DBHOST} ${DBUSER} ${DBPASS} --db $1 --archive=$2/$1.mongo
}

# backup all databases to dir
backupAll() {
  for i in $(db); do
    (backup $i $1)
  done
}
