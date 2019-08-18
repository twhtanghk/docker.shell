#!/bin/sh

cmd=`basename $0`
proj=$1
shift

export COMPOSE_OPTIONS="-e COMPOSEROOT=${PWD} -e INTRANETIP=${INTRANETIP}"
docker-compose -f ${proj}/docker-compose.yml ${cmd} $@
