#/bin/bash
# Does the user want the latest version
if [ "$EDGE" == "1" ]
	then
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
	exit
elif [ "$EDGE" == "0" ]
	then
		echo "edge not requested, using ruTorrent and Plugins release 3.6"
	exit
else
	echo "EDGE variable not set"
	exit
fi
