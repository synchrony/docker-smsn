FROM ubuntu
RUN apt update
RUN apt install -y git wget unzip maven
RUN apt install -y default-jre default-jdk # java

WORKDIR /root
RUN git clone -b develop https://github.com/joshsh/smsn.git
WORKDIR /root/smsn
RUN mvn clean install

CMD ["/bin/bash"]
