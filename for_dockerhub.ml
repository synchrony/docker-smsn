## What it is
This Docker image makes [Semantic Synchrony](https://github.com/joshsh/smsn/) easy to install.

## How to use it
Depending on your system's permissions, you might have to prefix the docker commands listed here with sudo.
Docker is supposedly easy to use in Windows and Mac, too. These steps work in Linux.
* To the right of this text there is a box labeled Docker Pull Command. Run the command in that box. Now you have this Docker image.
* Create a folder on your machine where the SmSn Neo4j graph and activity log will reside. Those contents don't have to exist yet.
* From a shell, run
```
docker run -it --network="host" -v /THE/FOLDER/YOU/MADE:/mnt/smsn-data jeffreybbrown/smsn:latest
```
(Substitute the path to the folder you made (including its name) where you see /THE/FOLDER/YOU/MADE.) This will bring up a shell within the Docker container. It's like another computer inside your computer.
* In the Docker container, navigate to `/root/gremlin` and run `start.sh`.
Now Gremlin Server is running, using Semantic Synchrony to serve the graph you gave it access to in the first step, at http://localhost:8182. When you terminate the Docker container, its data will vanish, but the graph at PATH will still be there.
* All that remains is to install Emacs and configure it to work with Semantic Synchrony -- see steps 6 and 7 [here](https://github.com/joshsh/smsn/wiki/Extend-o-Brain-installation).

## How it was built + history of changes
* https://github.com/JeffreyBenjaminBrown/docker-smsn
