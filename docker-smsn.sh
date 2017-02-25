#!/bin/bash

TINKERPOP_VERSION=3.2.4
GREMLIN=apache-tinkerpop-gremlin-server-$TINKERPOP_VERSION

apt update
apt install -y git wget unzip
apt install -y default-jre default-jdk # java


               ## Semantic Synchrony
apt install -y maven
cd /root
git clone https://github.com/joshsh/smsn.git
cd /root/smsn
mvn clean install


               ## Tinkerpop
cd /root

if [ -f /mnt/$GREMLIN-bin.zip ]; then
    cp /mnt/$GREMLIN-bin.zip .
else
    wget "http://www-eu.apache.org/dist/tinkerpop/3.2.4/$GREMLIN-bin.zip"
fi

unzip $GREMLIN-bin.zip 
rm $GREMLIN-bin.zip

cd $GREMLIN
bin/gremlin-server.sh -i org.apache.tinkerpop neo4j-gremlin 3.2.4

mkdir -p ext/smsn/plugin
cp /root/smsn/smsn-server/target/smsn-server-*-standalone.jar ext/smsn/plugin

cp /mnt/gremlin-server-smsn.yaml /mnt/neo4j.properties /mnt/smsn.properties conf
