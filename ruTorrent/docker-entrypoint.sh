#!/bin/sh
set -ex

reset_permission() {
    chown -R torrent. /torrent/download
    chown -R torrent. /torrent/watch
}

reset_permission

exec "$@"

