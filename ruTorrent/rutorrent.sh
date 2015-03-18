#!/bin/bash
set -ex

export HOME=~nobody
cd "$HOME"

LOCK_FILE="/download/.rtorrent.lock"


    # Make sure that only an instance of rtorrent form this container
    # handling files in download folder
    if ! flock --nonblock --exclusive 9; then
        >&2 echo 'Some container are managing download folder'
        exit 1
    fi

    # rtorrent locking does not play well with docker container
    # since we use external lock, remove silly lock file
    rm -f "$HOME/.rtorrentsession/rtorrent.lock"

	/usr/bin/tmux new-session -d rtorrent



