#!/bin/sh
set -eu

if [ "$1" = "check" ]; then
    echo "Container is ready to be used"
    exit 0
fi

if [ "$1" = "bash" ]; then
    exec bash
    exit 0
fi

if [ "$#" -eq 0 ]; then
    echo "No parameters supplied. Execute Default Action"
    exit 0
fi
