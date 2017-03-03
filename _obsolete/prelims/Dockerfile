FROM ubuntu

RUN apt update
RUN apt install -y git wget unzip maven
RUN apt install -y default-jre default-jdk # java
RUN apt install -y tcpdump net-tools locales python

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
RUN git checkout 0fb1fffb0b99b8a5d9a1e6563d9ee6de5d467ffc # ! hack
RUN mvn clean install

CMD ["/bin/bash"]
