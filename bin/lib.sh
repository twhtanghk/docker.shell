#!/bin/sh

# return 0 if container is running, otherwise return 1
docker_running() {
	local ret=$(docker inspect --format="{{ .State.Running }}" $1 2>/dev/null)
	ret=${ret:='false'}
	return test ${ret} = 'true'
}

# echo ip for input container $1
docker_ip() {
	local ret=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1 2>/dev/null`
	echo ${ret:=''}
}

# get dns option with nameserver lookup from container dnsdock and then ns1
# only container dnsdock started, echo "--dns=172.17.0.4"
# both container dnsdock and ns1 started, echo "--dns=172.17.0.4 --dns=172.17.0.6" 
docker_dns() {
	local ip="$(docker_ip dnsdock) $(docker_ip ns1)"
	local ret=""
	for i in ${ip}; do
		ret="${ret} --dns=$i"
	done
	echo ${ret}
}

# input parameters:
#	image, name, env, dns, port, vol, cmd
docker_run() {
	local env="-d ${env}"
	docker run ${env} ${dns} ${port} ${vol} ${name} ${image} ${cmd}  
}

# input parameters:
#	image, name, env, dns, port, vol
docker_debug() {
	local env="-it --entrypoint=/bin/sh ${env}"
	docker run ${env} ${dns} ${port} ${vol} ${name} ${image}
}

file=$(readlink -f "$0")
root=$(dirname $(dirname "$file"))
env="${HTTP_PROXY:+-e HTTP_PROXY=${HTTP_PROXY}}"
vol="-v /etc/ssl/certs:/etc/ssl/certs:ro -v /usr/local/share/ca-certificates:/usr/local/share/ca-certificates:ro"
dns="$(docker_dns)"