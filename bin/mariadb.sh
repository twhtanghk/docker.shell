#!/bin/sh

docker run -d -e MYSQL_ALLOW_EMPTY_PASSWORD=yes --name $1 mariadb