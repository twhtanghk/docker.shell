#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh
dir="${root}/oauth2"

image="python:2"
name="${1:+--name $1}"
vol="${vol} -v ${root}/OAuth2:/usr/src/app -v ${dir}/conf/env.py:/usr/src/app/organization/env.py -v ${dir}/log:/usr/src/app/log"

docker_run