#!/bin/sh
set -eu

export DEBIAN_FRONTEND=noninteractive

echo "Running apt-get update"
apt-get update -qq > /dev/null

echo "Running apt-get install"
apt-get install --no-install-recommends \
    ruby-full \
    build-essential \
    zlib1g-dev \
    -qq \
    > /dev/null

echo "Running cleaning routines"
apt-get clean
rm -rf /var/lib/apt/lists/*

