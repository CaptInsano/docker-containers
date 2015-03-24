FROM phusion/baseimage:0.9.16
MAINTAINER Capt.Insano

# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Configure user nobody to match unRAID's settings
 RUN \
 usermod -u 99 nobody && \
 usermod -g 100 nobody && \
 usermod -d /home nobody && \
 chown -R nobody:users /home
 
 # Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

#Make Directory for Tonido
RUN mkdir /usr/local/tonido

#Install Tonido
RUN \
  apt-get update -q && \
  apt-get -qy install\
  wget\
  curl && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/* && \
  cd /usr/local/tonido && \
  wget --no-check-certificate -O tonido64.tar.gz http://www.tonido.com/download.php?tonido64.tar.gz && \
  tar -zxvf tonido64.tar.gz && \
  rm tonido64.tar.gz
  
# grab gosu for easy step-down from root
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture)" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture).asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu
	
# Copy in start scripts
COPY docker-*.sh /
RUN chmod 777 /docker-*.sh
COPY test.sh /
RUN chmod 777 /test.sh
	
# Expose Port
EXPOSE 10001


CMD ["/test.sh"]
