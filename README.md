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

## bin/rmExited.sh
* remove those docker containers already exited


## bin/docker-compose
* start container to run docker compose ui
```
bin/docker-compose -f compose/composeui/docker-compose.yml up
```
* visit localhost:5000 by browser
```
google-chrome http://localhost:5000
```
* up, or down those defined services under folder compose/**/docker-compose.yml