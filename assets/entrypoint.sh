#!/bin/sh
set -e

if [ "x$1" = 'x/usr/vpnclient/vpnclient' ]; then
    chown -R softether:softether /usr/vpnclient
    setcap 'cap_net_bind_service=+ep' /usr/vpnclient/vpnclient

    echo "Starting SoftEther VPN Client"
    exec su-exec softether sh -c "`echo $@`"
else
    exec "$@"
fi
