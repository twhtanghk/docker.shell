#!/bin/sh

NAME=$1			# vlan name
VLAN=$2
VIF=$3			# virtual interface
LOCAL=$4		# local ip of virtual interface
REMOTE=$5		# remote ip of virtual interface

ovs-vsctl add-br ${NAME}
ovs-vsctl add-port ${NAME} ${VLAN} -- set Interface ${VLAN} type=vxlan options:remote_ip=${REMOTE}
ovs-vsctl add-port ${NAME} ${VIF} -- set Interface ${VIF} type=internal
ifconfig ${VIF} ${LOCAL} netmask 255.255.255.0 up