FROM ubuntu
RUN echo "last fully rebuilt 2020 03 19"
  # PITFALL: b/c apt, etc. can go stale

RUN echo "root:smsn" | chpasswd

# where to mount data
RUN mkdir /mnt/smsn-data

# choose a character set
RUN apt-get clean && apt-get update
RUN apt-get install locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# misc prerequisites
RUN apt update
RUN apt install -y git wget unzip maven vim
RUN apt install -y default-jre default-jdk # java
RUN apt install -y tcpdump net-tools locales python # maybe not needed

# a web library for python
WORKDIR /root
RUN wget http://webpy.org/static/web.py-0.38.tar.gz
RUN tar -xvzf web.py-0.38.tar.gz && rm web.py-0.38.tar.gz
WORKDIR /root/web.py-0.38
RUN python setup.py install

# gremlin server: install, and build the neo4j plugin for it
RUN echo "The time is jue jun 18 18:31:48 -05 2020"
ENV GS_VERSION 3.2.5
ENV GS_FOLDER /root/apache-tinkerpop-gremlin-server-${GS_VERSION}
COPY apache-tinkerpop-gremlin-server-${GS_VERSION} ${GS_FOLDER}
COPY grapeConfig.xml /root/.groovy/grapeConfig.xml
RUN ln -s ${GS_FOLDER} /root/gremlin
WORKDIR                /root/gremlin
RUN chmod u+x /root/gremlin/bin/gremlin-server.sh && \
              /root/gremlin/bin/gremlin-server.sh -i  \
              org.apache.tinkerpop neo4j-gremlin ${GS_VERSION}

RUN apt install -y iproute2

# configure Gremlin for Semantic Synchrony
RUN mkdir -p /root/gremlin/ext/smsn/plugin
COPY start-smsn.sh checkout-sample-data.sh rotate-log.sh /root/gremlin/
COPY smsn-server-1.5-all.jar /root/gremlin/ext/smsn/plugin
COPY gremlin-server-smsn.yaml neo4j.properties \
   /root/gremlin/conf/
RUN ln -s /mnt/smsn-data/smsn.yaml /root/gremlin/conf/smsn.yaml

EXPOSE 8182

RUN chmod 700 start-smsn.sh rotate-log.sh checkout-sample-data.sh
CMD ["/bin/bash"]
