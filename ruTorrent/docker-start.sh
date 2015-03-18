#!/bin/sh

# Does the user want the edge version?
if [ -z "$EDGE" ]; then
echo "edge not requested, using ruTorrent and Plugins release 3.6"
else
echo "getting latest git version of ruTorrent and Plugins"
if [ -f /var/www/rutorrent/.gitignore ]; then
echo "prev GIT version detected, updating"
git -C /var/www/rutorrent/ pull
else
echo "no prev GIT version detected, cloning"
rm -rf /var/www/rutorrent
git clone -b master https://github.com/Novik/ruTorrent.git /var/www/rutorrent
rm /var/www/rutorrent/conf/config.php
cp /config.php /var/www/rutorrent/conf/config.php
fi
chmod -R 755 /var/www
chown -R www-data. /var/www
fi

# Continue Docker Start
chown -R nobody:users /config
chown -R nobody:users /download

# Check if config exists. If not, copy in the sample config
if [ -f /config/.rtorrent.rc ]; then
  chown torrent:users /config/.rtorrent.rc
  chmod 777 /config/.rtorrent.rc
  echo "Using existing config file."

  else

  echo "Creating config from template."
  cp  /rtorrent.rc /config/.rtorrent.rc
  chown torrent:users /config/.rtorrent.rc
  chmod 777 /config/.rtorrent.rc
fi

mkdir /config/.rtorrentsession
chown torrent:www-data /config/.rtorrentsession
chmod 777 /config/.rtorrentsession

set -ex

service nginx start
service php5-fpm start

cd ~torrent
exec gosu torrent /rutorrent.sh

