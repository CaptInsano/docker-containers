#!/bin/bash
# Does the user want the latest version
if [ -n "$EDGE" ]
then
echo "EDGE variable found"
  if [ "$EDGE" == "1" ]; then
	echo "EDGE=1"
		if [ -f /config/rutorrent/.gitignore ]; then
			echo "prev GIT version detected, updating"
			git -C /config/rutorrent/ pull
			chown -R torrent:www-data /config/rutorrent
			exit
		else
			echo "no prev GIT version detected, cloning"
			rm -rf /config/rutorrent
			git clone -b master https://github.com/Novik/ruTorrent.git /config/rutorrent
			rm /config/rutorrent/conf/config.php
			cp /config.php /config/rutorrent/conf/config.php
			chown -R torrent:www-data /config/rutorrent
			exit
		fi
  elif [ "$EDGE" == "0" ]
  then
    echo "edge not requested, using ruTorrent and Plugins release 3.6"
  exit
  else
    echo "EDGE variable incorrect; Must be uppercase and can be 0 or 1 only"
    exit
  fi
else
  echo -e "EDGE variable  not found\n"
fi