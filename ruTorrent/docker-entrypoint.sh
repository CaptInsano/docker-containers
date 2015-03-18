#!/bin/sh
set -ex

reset_permission() {
    chown -R nobody:users /download
	chmod -R 777 /download
}

reset_permission

exec "$@"

