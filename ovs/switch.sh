#!/bin/sh

SW=$(hostname)
PORT=internet
IP=$1
GATEWAY=$2
CTL="tcp:${GATEWAY}:6633"

ovs-vsctl add-br ${SW}
ovs-vsctl add-port ${SW} ${PORT} tag=64 -- set Interface ${PORT} type=internal
ifconfig ${PORT} ${IP} netmask 255.255.255.0 up
ovs-vsctl set-controller ${SW} ${CTL}
