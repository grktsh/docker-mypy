#!/bin/sh
set -e

if [ "$1" != "mypy" -a "$1" != "stubgen" ]; then
    set -- mypy "$@"
fi

exec "$@"
