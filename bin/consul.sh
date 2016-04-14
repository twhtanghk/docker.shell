#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh

image="progrium/consul"
name="$(docker_name $1)"
port="-p 8500:8500 -p 8400:8400 -p 8600:53/udp"
cmd="-server -bootstrap"
dns=""

docker_run
