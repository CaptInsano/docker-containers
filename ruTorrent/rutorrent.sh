#!/bin/bash
set -ex

export HOME=~nobody
cd "$HOME"

TMUX_BIN=${TMUX_BIN:-/usr/bin/tmux}
LOCK_FILE="/download/.rtorrent.lock"

(
    # Make sure that only an instance of rtorrent form this container
    # handling files in download folder
    if ! flock --nonblock --exclusive 9; then
        >&2 echo 'Some container are managing download folder'
        exit 1
	else
		echo "starting rTorrent"
		exit 1
    fi

    # rtorrent locking does not play well with docker container
    # since we use external lock, remove silly lock file
    rm -f "$HOME/.rtorrentsession/rtorrent.lock"

    "$TMUX_BIN" new-session -d rtorrent

    TMUX_SERVER_PID="$("$TMUX_BIN" run-shell 'echo $TMUX_BIN' | cut -d ',' -f 2)"
echo rTorrent PID: $TMUX_SERVER_PID
    done
) 9>$LOCK_FILE 2>&1

