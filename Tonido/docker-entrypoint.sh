#!/bin/sh
set -ex

reset_permission() {
    chown -R nobody:users /usr/local/tonido
}

reset_permission

exec "$@"

