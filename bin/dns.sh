#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh
dir="${root}/dns"

image="twhtanghk/docker.dns"
name="${1:+--name $1}"
env="${env} --link mongo:mongo"
dns="--dns=127.0.0.1"
vol="${vol} -v ${dir}/conf/production.coffee:/usr/src/app/config/env/production.coffee -v ${dir}/conf/conf.d:/usr/src/app/conf.d -v ${dir}/conf/conf.d/bind9:/etc/default/bind9 -v ${dir}/log:/usr/src/app/log"

docker_run