#!/bin/sh

cmd=`basename $0`
proj=$1
shift

docker compose -f ${proj}/docker-compose.yml ${cmd} $@
