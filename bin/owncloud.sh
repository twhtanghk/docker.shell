#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh
dir="${root}/owncloud"

image="owncloud"
name="${1:+--name $1}"
vol="${vol} -v ${dir}/config:/var/www/html/config -v ${dir}/apps:/var/www/html/apps -v ${dir}/data:/var/www/html/data"

docker_run