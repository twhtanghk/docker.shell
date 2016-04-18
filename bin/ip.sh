#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh

docker_ip $@