#!/bin/sh

rpcbind
rpc.statd -L
rpc.idmapd
dbus-uuidgen --ensure
dbus-daemon --system --fork
exec /usr/bin/ganesha.nfsd -F -L /dev/stdout -f /etc/ganesha/ganesha.conf
