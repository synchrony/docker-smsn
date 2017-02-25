#!/bin/bash

TINKERPOP_VERSION=3.2.4
SMSN_VERSION=

# determine installation directory
echo "Installation directory = ?"
read INSTALL_DIR
if [[ -z $INSTALL_DIR ]]; then
  INSTALL_DIR="$(pwd)"
  echo "installing into current directory: $INSTALL_DIR"
elif [ -f "$INSTALL_DIR" ]; then
  echo "$INSTALL_DIR is a regular file, not a directory"
  exit 1
else
  mkdir -p $INSTALL_DIR
  echo "created $INSTALL_DIR"
fi
cd $INSTALL_DIR

# fetch and expand Gremlin Server
GREMLIN_SERVER_DIR=apache-tinkerpop-gremlin-server-${TINKERPOP_VERSION}
GREMLIN_SERVER_ZIP=apache-tinkerpop-gremlin-server-${TINKERPOP_VERSION}-bin.zip
if [ -d "${GREMLIN_SERVER_DIR}" ]; then
  echo "Gremlin Server directory $GREMLIN_SERVER_DIR already exists. Skipping."
  exit 0
else
  echo "choosing a Gremlin Server mirror"
  curl https://www.apache.org/dyn/closer.lua/tinkerpop/${TINKERPOP_VERSION}/${GREMLIN_SERVER_ZIP} > mirrors.html
  GREMLIN_SERVER_DOWNLOAD=$(cat mirrors.html | grep apache-tinkerpop-gremlin-server | head -1 | sed 's/.*href..//' | sed 's/".*//')
  rm mirrors.html
  echo "downloading Gremlin Server from $GREMLIN_SERVER_DOWNLOAD"
  rm -rf ${GREMLIN_SERVER_DIR}
  curl -O ${GREMLIN_SERVER_DOWNLOAD}
  unzip ${GREMLIN_SERVER_ZIP}
fi


IVY_JAR=../${GREMLIN_SERVER_DIR}/lib/ivy-*.jar
mkdir lib

java -jar $IVY_JAR -dependency net.fortytwo.smsn smsn-server 1.1 -cache lib -retrieve "lib/[artifact]-[revision](-[classifier]).[ext]"

java -jar $IVY_JAR -dependency net.fortytwo.smsn smsn-server 1.2-SNAPSHOT -retrieve "lib/[artifact]-[revision](-[classifier]).[ext]"
