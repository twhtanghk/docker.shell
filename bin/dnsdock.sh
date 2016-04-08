#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh
dir="${root}/docker"

image="phensley/docker-dns"
name="${1:+--name $1}"
port="-p 53:53/udp"
vol="${vol} -v /var/run/docker.sock:/docker.sock"

docker_run