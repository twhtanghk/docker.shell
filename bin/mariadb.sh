#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh
dir="${root}/mysql"

image="mariadb"
name="${1:+--name $1}"
env="${env} -e MYSQL_ALLOW_EMPTY_PASSWORD=yes"
vol="${vol} -v ${dir}/conf/my.cnf:/etc/mysql/my.cnf"

docker_run