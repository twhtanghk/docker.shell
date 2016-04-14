#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh
dir="${root}/docker"

image="docker:dind"
name="$(docker_name $1)"
env="${env} --privileged"
port="-p 2375:2375 -e PORT=2375 -p 80:80 -p 443:443 -p 53:53/udp"
vol="${vol} -v ${dir}/image:/var/lib/docker -v ${root}:/root"
cmd="--cluster-store=consul://127.0.0.1:8500 --cluster-advertise=$(docker_host):0"

docker_run
