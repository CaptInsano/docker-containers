#!/bin/bash

export HOME=~nobody
cd "$HOME"

    # rtorrent locking does not play well with docker container
    # since we use external lock, remove silly lock file
    rm -f "$HOME/.rtorrentsession/rtorrent.lock"

	/usr/bin/tmux new-session -d rtorrent



