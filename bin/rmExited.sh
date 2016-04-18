#!/bin/sh
	
docker rm `docker ps -a |grep -i exit |awk '{print $1}'`