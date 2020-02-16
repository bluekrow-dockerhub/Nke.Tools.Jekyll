#!/bin/sh
set -e

if [ "$1" = "check" ]; then
    echo "Container is ready to be used"
    exit 0
fi

echo "Executing override command"
exec "$@"
