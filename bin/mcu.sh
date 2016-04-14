#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh
dir="${root}/mcu"

image="twhtanghk/docker.esp8266"
name="${1:+--name $1}"
vol="${vol} -v ${dir}:/root/src"
env="${env} --device=/dev/ttyUSB0"

docker_debug
