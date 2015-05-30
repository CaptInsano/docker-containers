#!/bin/sh
set -ex

reset_permission() {
    chown -R torrent /download
	chmod -R 777 /download
}

reset_permission

exec "$@"

