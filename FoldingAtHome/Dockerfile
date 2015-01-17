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

#Install FAHClient
RUN \
  apt-get update -q && \
  apt-get install -qy wget && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/* && \
  wget --no-check-certificate -P /tmp/ https://fah.stanford.edu/file-releases/public/release/fahclient/debian-testing-64bit/v7.4/fahclient_7.4.4_amd64.deb && \
  dpkg -i --force-depends /tmp/fahclient_7.4.4_amd64.deb && \
  rm /tmp/fahclient_7.4.4_amd64.deb

#Expose Ports
EXPOSE 36330 7396

#Expose Config Folder
VOLUME ["/etc/fahclient/"]

#Create Config File
RUN mv /etc/fahclient/config.xml /etc/fahclient/config.xml.orig
ADD config.xml /etc/fahclient/config.xml


#Add firstrun.sh to create config.xml if needed
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

# Add FAHClient to runit
RUN mkdir /etc/service/FAHClient
ADD FAHClient-run.sh /etc/service/FAHClient/run
RUN chmod +x /etc/service/FAHClient/run