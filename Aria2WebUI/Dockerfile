FROM phusion/baseimage:0.9.15
MAINTAINER Capt.Insano

#Dockerfile based on Dockerfiles of smdion


# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Configure user nobody to match unRAID's settings
 RUN \
 usermod -u 99 nobody && \
 usermod -g 100 nobody && \
 usermod -d /home nobody && \
 chown -R nobody:users /home

# Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

#Install Aria2 and Dependencies for Aria2Web
RUN \
  apt-get update -q && \
  apt-get install -qy aria2 git apache2 && \
  apt-get clean -y

#Expose Ports
EXPOSE 6800 6881 80 443

#Expose Config Folder
VOLUME ["/downloads"]
VOLUME ["/config"]

#Add Aria2 init script and create empty config
ADD aria2c_init /etc/init.d/aria2c
RUN chmod +x /etc/init.d/aria2c
RUN update-rc.d aria2c defaults

#Add firstrun.sh to git clone Aria2WebUI if needed
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

# Add Aria2 to runit
RUN mkdir /etc/service/Aria2
ADD Aria2-run.sh /etc/service/Aria2/run
RUN chmod +x /etc/service/Aria2/run