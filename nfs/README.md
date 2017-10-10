# docker image running nfs-ganesha server with vfs or proxy backend

# VFS config
update host volume in docker-compose.yml
```
volumes:
  - ./ganesha.conf:/etc/ganesha/ganesha.conf
```

# PROXY config
update host volume in docker-compose.yml
```
volumes:
  - ./ganesha-proxy.conf:/etc/ganesha/ganesha.conf
```

# default exported path '/exports'
```
Path = /exports;
```
