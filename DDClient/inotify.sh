#!/bin/sh

while inotifywait -e modify /config; do
    /etc/init.d/ddclient restart
    echo "File in Config Folder Changed, Restarted"
done
