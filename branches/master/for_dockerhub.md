## What it is
This Docker image makes [Semantic Synchrony](https://github.com/joshsh/smsn/) easy to install.

This is the master branch, i.e. stable. If you want all the latest features, you can use the [develop branch](https://hub.docker.com/r/jeffreybbrown/smsn-develop/) instead.

## How to use it
Depending on your system's permissions, you might have to prefix the docker commands listed here with sudo.
Docker is supposedly easy to use in Windows and Mac, too. These steps work in Linux.
* To the right of this text there is a box labeled Docker Pull Command. Run the command in that box. Now you have this Docker image.
* Create a folder on your machine where the SmSn Neo4j graph and activity log will reside. Those contents don't have to exist yet.
* From a shell, run
```
docker run -v /THE/FOLDER/YOU/MADE:/mnt/smsn-data -p 8182:8182 -d -h 127.0.0.1 jeffreybbrown/smsn
```
(Substitute the path to the folder you made (including its name) where you see /THE/FOLDER/YOU/MADE.)
* Now Gremlin Server is running (inside a Docker virtual machine), using Semantic Synchrony to serve the graph you gave it access to in the first step, at http://localhost:8182. When you terminate the Docker container, its data will vanish, but the graph at PATH will still be there.
* All that remains is to test Gremlin Server, install Emacs, and configure Emacs to work with Semantic Synchrony -- start at "Step 5.1: test Gremlin Server" [here](https://github.com/joshsh/smsn/wiki/installation).

## How it was built + history of changes
* https://github.com/JeffreyBenjaminBrown/docker-smsn
