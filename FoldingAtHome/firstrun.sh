#!/bin/bash

#If fahclient.pid is left behind, remove it
if [ -f /var/run/fahclient.pid ]; then
   rm /var/run/fahclient.pid
else
   done
fi

# Check if config exists. If not, copy in the sample config
if [ -f /config/config.xml ]; then
  chmod 777 /config/config.xml
  echo "Using existing config file."
else
  echo "Creating config from template."
  mv /etc/fahclient/TeamUnRAID_Config.xml /config/config.xml
  chown nobody:users /config/config.xml
  chmod 777 /config/config.xml
fi