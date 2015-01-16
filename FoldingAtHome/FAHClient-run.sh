#!/bin/bash
#Check if service is running, if not start it.
if [ -f /var/run/fahclient.pid ]; then
  sleep 3600s
  exit
else
service FAHClient start
fi
