#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh

image="twhtanghk/docker.xrdp"
name="$(docker_name $1)"
port="-p 3389:3389"

docker_run
