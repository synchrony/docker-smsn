#!/bin/bash

env

cd $(dirname $0)

CONF=conf/gremlin-server-smsn.yaml

# adapted from github.com/htaox/NEAT
IP=$(ip -o -4 addr list eth0 | perl -n -e 'if (m{inet\s([\d\.]+)\/\d+\s}xms) { print $1 }')
echo "Using host $IP"
sed -i "s|^host:.*|host: $IP|" $CONF

if [ $# -gt 0 ]
  then
    echo "Using alternate port $1"
    sed -i "s|^port:.*|port: $1|" $CONF
fi

bash /root/gremlin/rotate-log.sh gremlin-server.log
bash /root/gremlin/bin/gremlin-server.sh $CONF 2>&1 | tee gremlin-server.log
