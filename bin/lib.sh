#!/bin/sh

file=$(readlink -f "$0")
root=$(dirname $(dirname "$file"))
vol="-v /etc/ssl/certs:/etc/ssl/certs:ro -v /usr/local/share/ca-certificates:/usr/local/share/ca-certificates:ro"