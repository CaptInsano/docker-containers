#!/bin/sh

# Continue Docker Start
chown -R nobody:users /usr/local/tonido

set -ex

exec gosu nobody "/usr/local/tonido/tonido.sh start"

