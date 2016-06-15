#!/bin/sh

export COMPOSE_OPTIONS="-e COMPOSEROOT=${PWD}"
bin/docker-compose -f compose/00-composeui/docker-compose.yml up -d
