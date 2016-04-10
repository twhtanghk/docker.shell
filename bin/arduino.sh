#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh
dir="${root}/arduino"

image="pandrew/arduino"
name="${1:+--name $1}"
vol="${vol} -v /dev/ttyACM0:/dev/ttyACM0 -v /tmp/.X11-unix:/tmp/.X11-unix -v ${dir}:/home/myroot -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group"
env="${env} --privileged -e DISPLAY=$DISPLAY -u myroot"

docker_run
