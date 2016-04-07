#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh

image="mongo"
name="${1:+--name $1}"

docker_run