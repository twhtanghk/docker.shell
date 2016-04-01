#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh
dir="${root}/dns"

vol="${vol} -v ${dir}/conf/production.coffee:/usr/src/app/config/env/production.coffee -v ${dir}/conf/conf.d:/usr/src/app/conf.d -v ${dir}/conf/conf.d/bind9:/etc/default/bind9 -v ${dir}/log:/usr/src/app/log"
port="-p 53:53/udp -p 53:53/tcp --dns=127.0.0.1"

docker run -d --link mongo:mongo ${port} ${vol} --name $1 twhtanghk/docker.dns
