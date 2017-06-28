FROM ubuntu
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

# python's web library
WORKDIR /root
RUN wget http://webpy.org/static/web.py-0.38.tar.gz
RUN tar -xvzf web.py-0.38.tar.gz && rm web.py-0.38.tar.gz
WORKDIR /root/web.py-0.38
RUN python setup.py install

# gremlin: install, and build the neo4j plugin for it
WORKDIR /root
COPY apache-tinkerpop-gremlin-server-3.2.5 /root/apache-tinkerpop-gremlin-server-3.2.5
WORKDIR /root/apache-tinkerpop-gremlin-server-3.2.5
RUN ln -s /root/apache-tinkerpop-gremlin-server-3.2.5 /root/gremlin

COPY grapeConfig.xml /root/.groovy/grapeConfig.xml
RUN /root/gremlin/bin/gremlin-server.sh -i org.apache.tinkerpop neo4j-gremlin 3.2.5

# install Emacs
RUN apt update
RUN apt install -y emacs

# configure Gremlin for Semantic Synchrony
RUN mkdir -p /root/gremlin/ext/smsn/plugin
COPY start.sh /root/gremlin
#COPY deploy-jar.sh /root/smsn
#RUN bash /root/smsn/deploy-jar.sh
COPY branches/develop/smsn-server-*-standalone.jar /root/gremlin/ext/smsn/plugin
  # we build smsn outside of docker
COPY gremlin-server-smsn.yaml neo4j.properties smsn.yaml /root/gremlin/conf/

# install SmSn-mode
WORKDIR /root
#RUN echo "Tue Jun  6 02:02:59 PDT 2017" >/dev/null
#RUN git clone -b emacs-too https://github.com/synchrony/smsn-mode
COPY branches/emacs-too/mode-emacs-too /root/smsn-mode

COPY branches/emacs-too/dot-emacs.el /root
RUN mv /root/dot-emacs.el /root/.emacs
RUN mkdir /root/.emacs.d /root/.emacs.d/elisp
RUN ln -s /root/smsn-mode/lisp /root/.emacs.d/elisp/smsn-mode-lisp

RUN chmod 700 /root/gremlin/start.sh
CMD ["/root/gremlin/start.sh"]
CMD ["/bin/bash"]
