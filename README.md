# docker.shell
Shell script to create docker containers

## bin/lib.sh
* define environment variables
** file:	full path of the executable script
** root:	docker.shell project directory
** vol:		default volumes (/etc/ssl/certs, /usr/local/share/ca-certificates) mounted to containers

## bin/docker.sh
* create docker in docker container with name 'dev'
* expose port 53 (domain), 2375 (docker)
* define 127.0.0.1 as nameserver in container
* define http_proxy as proxy server in container
* mount volume 
** ${root}/docker/image:/var/lib/docker
** ${root}:/root
```
docker pull docker:dind
bin/docker.sh dev
```

## bin/mongo.sh
* create mongo container with name 'mongo'
```
docker pull mongo
bin/mongo.sh mongo
```

## bin/dns.sh
* create dns container with name 'ns1'
* expose port 53 (domain)
* link container
** mongo:mongo
* mount volume
** ${root}/dns/conf/production.coffee:/usr/src/app/config/env/production.coffee
** ${dir}/conf/conf.d:/usr/src/app/conf.d
** ${dir}/conf/conf.d/bind9:/etc/default/bind9
** ${dir}/log:/usr/src/app/log
```
docker pull twhtanghk/docker.dns
bin/dns.sh ns1
```