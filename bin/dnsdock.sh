#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh
dir="${root}/docker"

image="tonistiigi/dnsdock"
name="${1:+--name $1}"
dns=""
port="-p 53:53/udp"
vol="${vol} -v /var/run/docker.sock:/var/run/docker.sock"
cmd="-verbose=true -nameserver=$(docker_ip ns1):53"

docker_run