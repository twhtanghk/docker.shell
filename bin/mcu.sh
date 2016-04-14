#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh
dir="${root}/mcu"

image="marcelstoer/nodemcu-build"
name="${1:+--name $1}"
vol="${vol} -v /dev/bus/usb:/dev/bus/usb -v ${dir}:/opt/nodemcu-firmware"
env="${env} --privileged"

docker_debug
