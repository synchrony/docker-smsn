#!/bin/bash

sed "s/8182/$1/" conf/gremlin-server-smsn.yaml >> temp.yaml
bash bin/gremlin-server.sh temp.yaml
