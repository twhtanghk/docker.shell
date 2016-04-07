#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh
dir="${root}/docker"

image="docker:dind"
name="${1:+--name $1}"
env="${env} --privileged"
dns="--dns=127.0.0.1"
port="-p 2375:2375 -e PORT=2375 -p 80:80 -p 3306:3306 -p 53:53/udp -p 53:53/tcp"
vol="${vol} -v ${dir}/image:/var/lib/docker -v ${root}:/root"

docker_run 