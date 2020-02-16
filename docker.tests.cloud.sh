#!/bin/sh

#Check Ubuntu Installation
NIX_OS="ubuntu"
NIX_DIST="eoan"

echo
echo ------------------
echo INITIALIZE TESTING
echo ------------------
RESULT_OS=$(cat /etc/os-release | grep '^ID=' | sed -e 's/^ID=//' )
echo Expected OS: $NIX_OS
echo Actual OS: $RESULT_OS
if [ "$RESULT_OS" = "$NIX_OS" ]; then 
    echo "Test - Installed OS: SUCCESS"
else
    echo "Test - Installed OS: FAILED"
    exit 1
fi

echo
RESULT_DIST=$(cat /etc/os-release | grep '^VERSION_CODENAME=' | sed -e 's/^VERSION_CODENAME=//' )
echo Expected DIST: $RESULT_DIST
echo Actual DIST: $NIX_DIST
if [ "$RESULT_DIST" = "$NIX_DIST" ]; then 
    echo "Test - Installed Distribution: SUCCESS"
else
    echo "Test - Installed Distribution: FAILED"
    exit 1
fi

exit 0