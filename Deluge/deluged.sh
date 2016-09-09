#!/bin/bash

if [ -z "$DELUGED_USER" ]
then
        DELUGED_USER=nobody
fi

exec /sbin/setuser $DELUGED_USER deluged -d -c /config -L info -l /config/deluged.log
