#!/bin/sh

# Does the user want the edge version?
if [ -z "$EDGE" ]; then
echo "edge not requested, using ruTorrent and Plugins release 3.6"
else
echo "getting latest git version of ruTorrent and Plugins"
if [ -f /config/rutorrent/.gitignore ]; then
echo "prev GIT version detected, updating"
git -C /config/rutorrent/ pull
else
echo "no prev GIT version detected, cloning"
rm -rf /config/rutorrent
git clone -b master https://github.com/Novik/ruTorrent.git /config/rutorrent
rm /config/rutorrent/conf/config.php
cp /config.php /config/rutorrent/conf/config.php
fi
chmod -R 777 /var/www
chown -R www-data. /var/www
fi

# Check if config exists. If not, copy in the sample config
if [ -f /config/.rtorrent.rc ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  cp  /rtorrent.rc /config/.rtorrent.rc
fi
# Continue Docker Start
chown -R nobody:users /config
chmod -R 777 /config
chown -R nobody:users /download
chmod -R 777 /download

mkdir /config/.rtorrentsession
chown nobody:www-data /config/.rtorrentsession
chmod 777 /config/.rtorrentsession

set -ex

service nginx start
service php5-fpm start

cd ~nobody
exec gosu nobody /usr/bin/tmux new-session -d rtorrent

