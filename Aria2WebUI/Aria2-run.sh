#!/bin/bash
echo "Starting Apache2"
/etc/init.d/apache2 start

if [ -f /config/aria2.conf ]; then
  echo "Config already exists"
  chown nobody /config/aria2.conf
  /etc/init.d/aria2c start
else
  echo "Creating blank config file"
  touch /config/aria2.conf
  chown nobody /config/aria2.conf
  echo "Starting Aria2"
  /etc/init.d/aria2c start
fi

