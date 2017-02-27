#!/bin/bash

               ## Tinkerpop
TINKERPOP_VERSION=3.2.4
GREMLIN=apache-tinkerpop-gremlin-server-$TINKERPOP_VERSION

cd /root

if [ -f /mnt/$GREMLIN-bin.zip ]; then
    cp /mnt/$GREMLIN-bin.zip .
else
    wget "http://www-eu.apache.org/dist/tinkerpop/3.2.4/$GREMLIN-bin.zip"
fi
unzip $GREMLIN-bin.zip 
rm $GREMLIN-bin.zip

cp /mnt/grapeConfig.xml /root/.groovy/grapeConfig.xml
cd $GREMLIN
bin/gremlin-server.sh -i org.apache.tinkerpop neo4j-gremlin 3.2.4

mkdir -p ext/smsn/plugin
cp /root/smsn/smsn-server/target/smsn-server-*-standalone.jar ext/smsn/plugin
cp /mnt/gremlin-server-smsn.yaml /mnt/neo4j.properties /mnt/smsn.properties conf
