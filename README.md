How to use this code:
* Navigate to where smsn-docker.sh (or this README file) is. Call that place PATH.
* Optional but recommended: Download apache-tinkerpop-gremlin-server-3.2.4-bin.zip to PATH.
    * This script can download it, but it's not smart about handling mirrors, hence slow.
    * Josh wrote a script that is clever about that; see the section called "# fetch and expand Gremlin Server" of the file install-smsn.unfinished.sh. I have not incorprated that code into this yet.
* From a shell, run this.
    * sudo docker run -it --name smsn-docker -v PATH:/mnt ubuntu bash
* After that, from within the resulting Docker-contained shell, run:
    * bash /mnt/docker-smsn.sh

This gives the Docker container access to all the files in PATH. It shoulkd not modify them. (Later, Docker will also have access through /mnt to a host folder called smsn-data, which it will modify.)



