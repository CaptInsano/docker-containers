#!/bin/sh

chown -R nobody:users /config
chown -R nobody:users /download

# Check if config exists. If not, copy in the sample config
if [ -f /config/.rtorrent.rc ]; then
  chown torrent:users /config/.rtorrent.rc
  chmod 777 /config/.rtorrent.rc
  echo "Using existing config file."

  else

  echo "Creating config from template."
  cp  /root/rtorrent.rc /config/.rtorrent.rc
  chown torrent:users /config/.rtorrent.rc
  chmod 777 /config/.rtorrent.rc
fi

set -ex

service nginx start
service php5-fpm start

cd ~torrent
exec gosu torrent /rutorrent.sh

