#!/bin/sh
# The Redis container entrypoint. Runs the server with the required
# flags and makes the socket accessible

set -e

mkdir /tmp/redis-socks
chmod 777 /tmp/redis-socks

redis-server \
    --tls-port 6380 \
    --tls-cert-file tls/server.crt \
    --tls-key-file tls/server.key \
    --tls-ca-cert-file tls/ca.crt \
    --tls-auth-clients no \
    --unixsocket /tmp/redis-socks/redis.sock \
    --unixsocketperm 777
