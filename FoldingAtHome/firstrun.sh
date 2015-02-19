#!/bin/bash

#If fahclient.pid is left behind, remove it
if [ -f /var/run/fahclient.pid ]; then
   rm /var/run/fahclient.pid
else
   echo "No previous PID file"
fi

# Check if config exists. If not, copy in the sample config
if [ -f /config/config.xml ]; then
  chown nobody:users /config/config.xml
  chmod 777 /config/config.xml
  echo "Using existing config file."

  else

  echo "Creating config from template."
  cp  /root/config.xml /config/config.xml
  chown nobody:users /config/config.xml
  chmod 777 /config/config.xml
fi

