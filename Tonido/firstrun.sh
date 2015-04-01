#!/bin/bash

echo "Fixing permissions of config files"
chown -R nobody:users /config
chmod -R 777 /config