#!/bin/bash

cd $(dirname $0)

CONF=conf/gremlin-server-smsn.yaml
if [ $# -gt 0 ]
  then
    echo "Using alternate port $1"
    sed "s/8182/$1/" $CONF > /tmp/gremlin-server-smsn-temp.yaml
    CONF=/tmp/gremlin-server-smsn-temp.yaml
fi

exec bin/gremlin-server.sh $CONF
