#!/bin/sh

NAME=$1			# vlan name
VLAN=$2
VIF=$3			# virtual interface
LOCAL=$4		# local ip of virtual interface
REMOTE=$5		# remote ip of virtual interface
MTU=1434		# "ping -s size remoteip" to get the appropriate mtu

# see https://blog.remibergsma.com/2015/03/26/connecting-two-open-vswitches-to-create-a-l2-connection/
# e.g.
# ./vxlan.sh internet vxlan0 vi0 localip remoteip
# ./vxlan.sh mgt vxlan1 vi1 localip remoteip
# ./vxlan.sh storage vxlan2 vi2 localip remoteip
# ./vxlan.sh intranet vxlan3 vi3 localip remoteip
ovs-vsctl add-br ${NAME}
ovs-vsctl add-port ${NAME} ${VLAN} -- set Interface ${VLAN} type=vxlan options:remote_ip=${REMOTE}
ovs-vsctl add-port ${NAME} ${VIF} -- set Interface ${VIF} type=internal
ifconfig ${VIF} ${LOCAL} netmask 255.255.255.0 mtu ${MTU} up