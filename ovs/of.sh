#!/bin/sh

NAME=$1			# vlan name
VIF=$2			# virtual interface
LOCAL=$3		# local ip of virtual interface
CTL=$4			# openflow controller (e.g. tcp:192.168.63.3:6653)

# see https://blog.remibergsma.com/2015/03/26/connecting-two-open-vswitches-to-create-a-l2-connection/
# e.g.
# ./of.sh internet vi0 localip
# ./of.sh mgt vi1 localip
# ./of.sh storage vi2 localip
# ./of.sh intranet vi3 localip
ovs-vsctl add-br ${NAME}
ovs-vsctl add-port ${NAME} ${VIF} -- set Interface ${VIF} type=internal
ifconfig ${VIF} ${LOCAL} netmask 255.255.255.0 up
ovs-vsctl set-controller ${NAME} ${CTL}
