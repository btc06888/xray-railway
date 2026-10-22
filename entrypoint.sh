#!/bin/sh
set -e
UUID=${UUID:-f2ea77d5-795d-4c11-949f-d8da1c3ed6ae}
WS_PATH=${WS_PATH:-/14d9d91c8bed18ab}
PORT=${PORT:-8080}
CONFIG=/etc/xray/config.json

sed -i "s/PORT_PLACEHOLDER/$PORT/g" $CONFIG
sed -i "s/UUID_PLACEHOLDER/$UUID/g" $CONFIG
sed -i "s|WS_PATH_PLACEHOLDER|$WS_PATH|g" $CONFIG

echo "=== xray config ==="
cat $CONFIG
echo "=== starting xray ==="

if [ -x /usr/bin/xray ]; then
  exec /usr/bin/xray run -config $CONFIG
elif [ -x /usr/local/bin/xray ]; then
  exec /usr/local/bin/xray run -config $CONFIG
else
  exec xray run -config $CONFIG
fi
