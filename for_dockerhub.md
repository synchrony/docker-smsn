# How to start the smsn server

Get Docker installed, somehow.

Download the `smsn-emacs-too` Docker image, by running `docker pull jeffreybbrown/smsn-emacs-too`.

In a terminal, start a Docker container running the image, by running this:

```
sudo docker run -it -v CHOOSE_THIS_FOLDER:/mnt/smsn-data jeffreybbrown/smsn-emacs-too:new-untested
```

In the above, instead of CHOOSE_THIS_FOLDER, type a path of your choosing, pointing to the folder that you want to let Docker control. The folder does not have to contain anything yet, but it can.

Docker is a "virtual environment". It has its own filesystem, and it does not see any of your native filesystem except the folder you gave it control of. That native folder is "mounted" to the folder `/mnt/smsn-data` in the Docker container.


# How to start the smsn client: Emacs in smsn-mode

Now that the server is running, open a second terminal, and find the name of the Docker container you just started, with `sudo docker ps`. You'll see something like this:

```
CONTAINER ID        IMAGE                                       COMMAND                  CREATED             STATUS              PORTS                    NAMES
54ca8726438f        jeffreybbrown/smsn-emacs-too:new-untested   "/root/gremlin/sta..."   2 minutes ago       Up 2 minutes                                 silly_blackwell
```

You can refer to the container via its ID (in this case "54ca8726438f") or by its randomly-generated name (in this case "silly_blackwell").

"Get into" the Docker container -- that is, enter an interactive Bash shell in it -- by executing this:

```
sudo docker exec -it CONTAINER_NAME
```

where `CONTAINER_NAME` is the container's ID or its randomly-generated name, which you found in the previous step.

Now you're in the Docker container. You can look around if you want -- run `pwd`, `ls`, `cd`, etc.

To start Emacs, type `emacs`. In Emacs, to start smsn-mode, type `M-x smsn` and press Enter. (`M-x` means "first press the Meta key, and then while holding it down, press x". The Meta key is usually Alt, but your system might be different.)

If the background turned blue, you're in!


# What's next?

Check out the [howto](https://github.com/synchrony/smsn/wiki/What-you-need-to-know-to-use-Semantic-Synchrony)!


# Limintations

Running emacs in a Docker container (usually) means it does not have access to the full color environment. 

Ordinarily, smsn displays text in different colors to indicate different sources -- for instance, public and private data. Until you want to split your graph across multiple sources, the fact that the text all looks the same color should be no limitation.

Ordinarily, a black cursor indicates edit-submode, and a green cursor indicates move-submode. The cursor color is not under our control in Docker, though. When you toggle submodes, there will be a message at the bottom of the screen indicating what you switched to. If you forget, you can just toggle again.

Within the Docker container, there is no concept of your native file tree. When you started the container, the passage `-v CHOOSE_THIS_FOLDER:/mnt/smsn-data` mounted the native folder `CHOOSE_THIS_FOLDER` to `/mnt/smsn-data` in the container. Therefore, if you want to import or export a file to `CHOOSE_THIS_FOLDER/subdirectory/FILE`, you will from within Emacs have to refer to it as if it was at `/mnt/smsn-data/subdirectory/FILE`.

