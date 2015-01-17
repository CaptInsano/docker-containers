#!/bin/bash

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