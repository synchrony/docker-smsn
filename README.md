This code created the Docker image for docker-smsn, located at
https://hub.docker.com/r/jeffreybbrown/smsn/

# This creates a Docker image with:
* Semantic Synchrony installed
* Gremlin-Server installed
* Gremlin-Server configured to work with SmSn

# Remaining to do:
* Connect to an external Emacs

# How to use it:
* First designate a spot (lets call it PATH) on your machine where the SmSn Neo4j graph and activity log will reside. Those contents don't have to exist yet.
    * The config files are designed such that docker-smsn expects to have access to an external folder called smsn-data/, located in the Docker container at /mnt, with a subfolder /mnt/smsn-data/neo4j to hold the graph and next to that a file /mnt/smsn-data/activity.log.
* From a shell, run "docker run -it --name smsn-docker -v PATH:/mnt jeffreybbrown/docker-smsn-prelims"

# How to build it yourself:
(You probably don't need to do this -- the image is already built on DockerHub.)
* Clone this Git repo somewhere.
* Navigate into that folder.
* Download [Gremlin Server](https://www.apache.org/dyn/closer.lua/tinkerpop/3.2.4/apache-tinkerpop-gremlin-console-3.2.4-bin.zip) and unzip it there.
* To build the master branch, run `(sudo) docker build -t [name] .`. Don't actually type the () or [] symbols. You might not need the `sudo`, and you can choose whatever name you want; a reasonable one would be `smsn`.
