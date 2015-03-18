#!/bin/sh
set -ex

reset_permission() {
    chown -R torrent /download
}

reset_permission

exec "$@"

