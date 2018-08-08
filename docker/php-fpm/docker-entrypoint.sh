#!/bin/sh
set -e

# allow the container to be started with `--user`
su-exec root /bin/sh -c "echo $(ip route | awk '/default/ { print $3 }') docker-server >> /etc/hosts"

exec "$@"
