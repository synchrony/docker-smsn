What this does:
* Creates a Docker container
* Installs Semantic Synchrony
* Sometimes, installs Gremlin-Server
    * Lately it can't seem to download Grapes
* Configures Gremlin-Server to work with SmSn

Remaining to do:
* Mount external graph (and activity log) data, which it will modify
    * The config files are designed such that docker-smsn expects to have access to an external folder called smsn-data/, located in the Docker container at /mnt, with a subfolder /mnt/smsn-data/neo4j to hold the graph and next to that a file /mnt/smsn-data/activity.log.
* Talk to an external Emacs
* Make a Docker image out of it

How to use this code:
* Navigate to where smsn-docker.sh (or this README file) is. Call that place PATH.
* Optional but recommended: Download the [Gremlin Server](https://www.apache.org/dyn/closer.lua/tinkerpop/3.2.4/apache-tinkerpop-gremlin-console-3.2.4-bin.zip) zip file to PATH.
    * This script can download it, but it's not smart about handling mirrors, hence slow.
    * Josh wrote a script that is clever about that; see the section called "# fetch and expand Gremlin Server" of the file install-smsn.unfinished.sh. I have not incorprated that code into this yet.
* From a shell, run this.
    * sudo docker run -it --name smsn-docker -v PATH:/mnt jeffreybbrown/docker-smsn-prelims bash
    * This gives the Docker container access to all the files in PATH. It does not modify them.
* After that, from within the resulting Docker-contained shell, run:
    * bash /mnt/docker-smsn.sh
