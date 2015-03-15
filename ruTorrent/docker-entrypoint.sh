#!/bin/sh
set -ex

reset_permission() {
    chown -R torrent /download
    chown -R torrent /download/watch
}

reset_permission

exec "$@"

