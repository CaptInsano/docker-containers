#!/bin/sh
set -ex

service nginx start
service php5-fpm start

cd ~torrent
exec gosu torrent /rutorrent.sh

