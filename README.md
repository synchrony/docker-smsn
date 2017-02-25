How to use this code:
  Navigate to where smsn-docker.sh is. Call that place PATH.
  From a shell, run this.
    sudo docker run -it --name smsn-docker -v PATH:/mnt ubuntu bash
    For instance, I use this:
      sudo docker run -it --name smsn-docker -v /home/jeff/docker-smsn:/mnt ubuntu bash
  After that, from within the resulting Docker-contained shell, run:
    bash /mnt/docker-smsn.sh

Note that this gives the Docker container access to all the files in PATH. It shoulkd not modify them. (Later, Docker will also have access through /mnt to a host folder called smsn-data, which it will modify.)

If PATH contains apache-tinkerpop-gremlin-server-3.2.4-bin.zip, the script will not have to download that again.

