# docker.shell
Shell script to create docker containers

## bin/lib.sh
* define environment variables
	* file:	full path of the executable script
	* root:	docker.shell project directory
	* env:	HTTP_PROXY if defined
	* vol:	default volumes (/etc/ssl/certs, /usr/local/share/ca-certificates) mounted to containers
	* dns:	"--dns=${ip of dnsdock container if started} --dns=${ip of ns1 container if started}"
* define functions
	* docker_running(container): return 0 if container started, or 1 otherwise
	* docker_ip(container): return ip address if container started, or empty string otherwise
	* docker_dns():	return "--dns=${ip of dnsdock container if started} --dns=${ip of ns1 container if started}"
	* docker_run(): run container with environment variables
		* image: image name (required)
		* name: container name (optional)
		* env: container environment or options (default: ${env} with HTTP_PROXY if defined)
		* dns: dns settings (default: ${dns})
		* port: ports to expose (default: '')
		* vol: volumes to mount (default: ${vol})
		* cmd: command to execute on container (default: '')
	*docker_debug(): debug container by running in interactive mode -it and -entrypoint=/bin/sh
		* parameters image, name, env, dns, port, vol defined in docker_run()
	*docker_stopAll(): stop
	
## bin/shell.sh
* execute shell on the specified container
* the following is to run shell on container docker in docker named 'dev' and run shell again on mongo container on top of 'dev'
```
bin/shell.sh dev
cd
bin/shell.sh mongo
```

## bin/stopAll.sh
* stop all docker containers

## bin/rmAll.sh
* remove all docker containers

## bin/docker.sh
* create docker in docker container 'docker:dind' with name 'dev'
* expose port 53 (domain), 2375 (docker)
* define 127.0.0.1 as nameserver in container
* mount volume 
	* export HTTP_PROXY=proxy.abc.com (if required)
	* ${root}/docker/image:/var/lib/docker
	* ${root}:/root
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

## bin/mariadb.sh
* create mariadb container with name 'mysql' and empty root password
* mount volume
	* ${dir}/conf/my.cnf:/etc/mysql/my.cnf (default listen to all interface instead of localhost only)
```
docker pull mariadb
bin/mariadb.sh mysql
```

## bin/dns.sh
* create dns container 'twhtanghk/docker.dns' with name 'ns1'
* link container
	* --link mongo:mongo
* dns settings
	* --dns=127.0.0.1
* mount volume
	* ${dir}/conf/production.coffee:/usr/src/app/config/env/production.coffee
	* ${dir}/conf/conf.d:/usr/src/app/conf.d
	* ${dir}/conf/conf.d/bind9:/etc/default/bind9
	* ${dir}/log:/usr/src/app/log"
```
docker pull twhtanghk/docker.dns
bin/dns.sh ns1	
```

## bin/dnsdock.sh
* create dnsdock container 'tonistiigi/dnsdock' with name 'dnsdock' for resolving containers' name
* dns settings
	* cmd options "-verbose=true -nameserver=$(docker_ip ns1):53"
* expose port
	* -p 53:53/udp
* mount volume
	*/var/run/docker.sock:/var/run/docker.sock"
```
docker pull tonistiigi/dnsdock
bin/dnsdock.sh dnsdock
```

## bin/nginx.sh
* create nginx container with name 'nginx'
* expose port 80 (http), 443 (https)
* mount volume 
	* ${root}/nginx/conf/nginx.conf:/etc/nginx/nginx.conf
	* ${root}/nginx/conf/conf.d:/etc/nginx/conf.d
	* ${root}/nginx/ssl/nginx.key:/etc/ssl/private/nginx.key
	* ${root}/nginx/ssl/nginx.pem:/etc/ssl/certs/nginx.pem
	* ${root}/nginx/log:/var/log/nginx
	* ${root}/nginx/www:/var/www
```
docker pull nginx:alpine
bin/nginx.sh nginx 
```