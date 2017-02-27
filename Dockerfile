FROM jeffreybbrown/docker-smsn-prelims

COPY apache-tinkerpop-gremlin-server-3.2.4 /root/apache-tinkerpop-gremlin-server-3.2.4
RUN ln -s /root/apache-tinkerpop-gremlin-server-3.2.4 /root/gremlin
COPY grapeConfig.xml /root/.groovy/grapeConfig.xml

RUN /root/gremlin/bin/gremlin-server.sh -i org.apache.tinkerpop neo4j-gremlin 3.2.4
RUN mkdir -p /root/gremlin/ext/smsn/plugin
RUN cp /root/smsn/smsn-server/target/smsn-server-*-standalone.jar /root/gremlin/ext/smsn/plugin
COPY gremlin-server-smsn.yaml neo4j.properties smsn.properties /root/gremlin/conf/

CMD ["/bin/bash"]
