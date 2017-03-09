FROM ubuntu

# where to mount data
RUN mkdir /mnt/smsn-data

# choose a character set
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# misc installs
RUN apt update
RUN apt install -y git wget unzip maven
RUN apt install -y default-jre default-jdk # java
RUN apt install -y tcpdump net-tools locales python # maybe not needed

# python's web library
WORKDIR /root
RUN wget http://webpy.org/static/web.py-0.38.tar.gz
RUN tar -xvzf web.py-0.38.tar.gz && rm web.py-0.38.tar.gz
WORKDIR /root/web.py-0.38
RUN python setup.py install

# Semantic Synchrony
WORKDIR /root
RUN git clone -b develop https://github.com/joshsh/smsn.git
WORKDIR /root/smsn
# RUN git checkout 301ac82476dac26db44c9f55e40ce82e8ae1ef13 # ! hack
RUN git pull
RUN mvn clean install

# gremlin
WORKDIR /root
COPY apache-tinkerpop-gremlin-server-3.2.4 /root/apache-tinkerpop-gremlin-server-3.2.4
WORKDIR /root/apache-tinkerpop-gremlin-server-3.2.4
RUN ln -s /root/apache-tinkerpop-gremlin-server-3.2.4 /root/gremlin
COPY grapeConfig.xml /root/.groovy/grapeConfig.xml

RUN /root/gremlin/bin/gremlin-server.sh -i org.apache.tinkerpop neo4j-gremlin 3.2.4
RUN mkdir -p /root/gremlin/ext/smsn/plugin

# COPY copies from the Docker context; "RUN cp", from within the container
RUN cp /root/smsn/smsn-server/target/smsn-server-*-standalone.jar /root/gremlin/ext/smsn/plugin
COPY gremlin-server-smsn.yaml neo4j.properties smsn.properties /root/gremlin/conf/

CMD ["/bin/bash"]
