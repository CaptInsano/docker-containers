#!/bin/bash

#If fahclient.pid is left behind, remove it
if [ -f /var/run/fahclient.pid ]; then
   rm /var/run/fahclient.pid
else
   echo "No previous PID file"
fi

# Check if config exists. If not, copy in the sample config
if [ -f /etc/fahclient/config.xml ]; then
  chown nobody:users /etc/fahclient/config.xml
  chmod 777 /etc/fahclient/config.xml
  echo "Using existing config file."
  
  else
  
  echo "Creating config from template."
  wget --no-check-certificate -P /tmp/ https://github.com/CaptInsano/docker-containers/blob/master/FoldingAtHome/config.xml &&
  mv /tmp/config.xml /etc/fahclient/config.xml
  chown nobody:users /etc/fahclient/config.xml
  chmod 777 /etc/fahclient/config.xml
fi