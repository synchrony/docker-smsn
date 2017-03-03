This Docker image makes [Semantic Synchrony](https://github.com/joshsh/smsn/) easy to install.

Docker is supposedly easy to use in Windows and Mac, too. These steps work in Linux.

How to use it:
* To the right of this text there is a box labeled Docker Pull Command. Run the command in that box. Now you have this Docker image.
* Designate a spot (lets call it `PATH`) on your machine where the SmSn Neo4j graph and activity log will reside. Those contents don't have to exist yet.
* From a shell, run
```
docker run -it --name smsn-docker -v PATH:/mnt jeffreybbrown/smsn.2017-03-03
```
This will bring up a shell within the Docker container. It's like another computer inside your computer.
* In the Docker container, navigate to `/root/gremlin` and run
```
bash bin/gremlin-server.sh conf/gremlin-server-smsn.yaml
```
Now Gremlin Server is running, using Semantic Synchrony to serve the graph you gave it access to in the first step, at http://localhost:8182.
* All that remains is to install Emacs and configure it to work with Semantic Synchrony -- see steps 6 and 7 [here](https://github.com/joshsh/smsn/wiki/Extend-o-Brain-installation).

How it was built:
* https://github.com/JeffreyBenjaminBrown/docker-smsn
