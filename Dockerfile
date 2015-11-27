#
# Ubuntu Desktop (LXDE) Dockerfile
#
# https://github.com/dockerfile/ubuntu-desktop
#

# Pull base image.
FROM debian:jessie 

# Install LXDE and VNC server.
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install --fix-missing -y mate-desktop-environment-core tightvncserver && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]

# Expose ports.
EXPOSE 5901

RUN echo "deb     http://qgis.org/debian jessie main" >> /etc/apt/sources.list
#RUN /usr/bin/wget -O - http://qgis.org/downloads/qgis-2015.gpg.key | gpg --import
#RUN gpg --export --armor 3FF5FFCAD71472C4 | apt-key add -
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key 3FF5FFCAD71472C4
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y qgis python-qgis qgis-plugin-grass
RUN mkdir /root/.vnc && echo "debian" | vncpasswd -f > /root/.vnc/passwd && chmod 600 /root/.vnc/passwd
