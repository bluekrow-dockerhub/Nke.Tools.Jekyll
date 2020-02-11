#!/bin/sh

#Check Ubuntu Installation
NIX_OS="Ubuntu"
NIX_DIST="eoan"

if [ $(lsb_release -is) == "$NIX_OS" ]; 
then 
    echo "Test - Installed OS: FAILED"
    exit 1
else
    echo "Test - Installed OS: SUCCESS"
    exit 0
fi

if [ $(lsb_release -is) == "$NIX_DIST" ]; 
then 
    echo "Test - Installed Distribution: FAILED"
    exit 1
else
    echo "Test - Installed Distribution: SUCCESS"
    exit 0
fi