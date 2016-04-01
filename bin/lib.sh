#!/bin/sh

file=$(readlink -f "$0")
root=$(dirname $(dirname "$file"))
env="-e HTTP_PROXY=${HTTP_PROXY}"
vol="-v /etc/ssl/certs:/etc/ssl/certs:ro -v /usr/local/share/ca-certificates:/usr/local/share/ca-certificates:ro"