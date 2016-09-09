#!/bin/bash

if [ -z "$DELUGED_USER" ]
then
	DELUGED_USER=nobody
fi

exec /sbin/setuser $DELUGED_USER deluge-web -c /config
