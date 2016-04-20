#!/bin/sh

LOCAL=$1
REMOTE=$2

ovs-vsctl add-br host
ovs-vsctl add-port host vxlan0 -- set Interface vxlan0 type=vxlan options:remote_ip=${REMOTE}
ovs-vsctl add-port host vi0 -- set Interface vi0 type=internal
ifconfig vi0 ${LOCAL} netmask 255.255.255.0 up
