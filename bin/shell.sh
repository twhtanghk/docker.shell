#!/bin/sh

docker exec -it ${1} sh -c "export TERM=xterm; cd; exec sh"