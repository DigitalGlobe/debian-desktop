# debian-desktop
A dockerfile that builds debian jessie and the MATE desktop environment with vnc.  Latest QGIS is also included.

This repo includes a dockerfile that builds debian jessie and the MATE desktop environment.  It is bundled with VNC as well and also includes the latest version of QGIS.  Before running these instructions, first install docker.  If you are on a mac you should use Docker Toolbox (https://docs.docker.com/mac/step_one/).

* Clone the repo.

* cd into the cloned directory and build the docker with this command:

```docker build -t debian-desktop - < Dockerfile```

* Run the container with this command:

```docker run -it --rm -p 5901:5901 -e USER=root debian-desktop     bash -c "touch /root/.Xresources && vncserver :1 -geometry 1280x800 -depth 24 && tail -F /root/.vnc/*.log"```

To connect to the running container, you will need a vnc client like realvnc (https://www.realvnc.com/download/viewer/).  Install the client on your machine.  Next you will need to find the ip address of your running container.  There are various ways to do this, try typing ```docker ps``` and getting the container id, and then type ```docker inspect <container_id>```.  If you are on a mac this might not work as the ip address may be listed as 0.0.0.0.  On a mac do this: ```docker-machine ip default```.  This will tell you the ip address of the VM, in this case called "default".

* Connect to the container.  In the vnc connection string, type this:

"ipaddress:1"

The password is "debian".

That's it!

