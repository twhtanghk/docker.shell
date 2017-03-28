#!/bin/bash

cmd=`basename $0`
proj=$1
shift

export COMPOSE_OPTIONS="-e COMPOSEROOT=${PWD}"
for i in DISPLAY; do
  COMPOSE_OPTIONS="${COMPOSE_OPTIONS} -e ${i}=${!i}"
done
  
bin/docker-compose -f ${proj}/docker-compose.yml ${cmd} $@
