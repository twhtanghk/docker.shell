# docker image running glusterfs server

# gluster config
add peer servers
```
gluster peer probe server1
gluster peer probe server2
gluster peer probe server3
gluster peer probe server4
```

check peer servers status "Peer in Cluster"
```
gluster peer status
gluster pool list
```

create volume
```
gluster volume create vol replica 2 transport tcp server1:/data/vol server2:/data/vol server3:/data/vol server4:/data/vol 
```

mount volume
```
mount -t glusterfs server2:/vol /mnt
```
