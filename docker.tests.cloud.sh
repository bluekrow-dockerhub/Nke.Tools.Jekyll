#!/bin/sh

echoInfo () {
	echo "\e[92m$1\e[0m"
}

echoError () {
	echo "\e[91m\e[5m$1\e[0m"
}

echo
echo ------------------
echo INITIALIZE TESTING
echo ------------------
#Check Ubuntu installation
NIX_OS="ubuntu"
RESULT_OS=$(cat /etc/os-release | grep '^ID=' | sed -e 's/^ID=//' )
echo Expected OS: $NIX_OS
echo Actual OS: $RESULT_OS
if [ "$RESULT_OS" = "$NIX_OS" ]; then 
    echoInfo "Test - Installed OS: SUCCESS"
else
    echoError "Test - Installed OS: FAILED"
    exit 1
fi

echo
#Check Distro installation
NIX_DIST="eoan"
RESULT_DIST=$(cat /etc/os-release | grep '^VERSION_CODENAME=' | sed -e 's/^VERSION_CODENAME=//' )
echo Expected DIST: $NIX_DIST
echo Actual DIST: $RESULT_DIST
if [ "$RESULT_DIST" = "$NIX_DIST" ]; then 
    echoInfo "Test - Installed Distribution: SUCCESS"
else
    echoError "Test - Installed Distribution: FAILED"
    exit 1
fi

echo
#Check Ruby installation
RUBY_INSTALL="ruby"
RESULT_RUBY=$(ruby --version | sed -e 's/\ .*//')
echo Expected Software: $RUBY_INSTALL
echo Actual Software: $RESULT_RUBY
if [ "$RESULT_RUBY" = "$RUBY_INSTALL" ]; then 
    echoInfo "Test - Ruby Installation: SUCCESS"
else
    echoError "Test - Ruby Installation: FAILED"
    exit 1
fi

echo
#Check Gems installation
RESULT_GEMS=$(gem --version)
echo Actual Software: $RESULT_GEMS
if [ -n "$RESULT_GEMS" ]; then 
    echoInfo "Test - RubyGems  Installation: SUCCESS"
else
    echoError "Test - RubyGems Installation: FAILED"
    exit 1
fi

echo
#Check Gems Home installation
GEM_HOME_INSTALL="/usr/local/bundle"
RESULT_GEM_HOME=$GEM_HOME
echo Expected Software: $GEM_HOME_INSTALL
echo Actual Software: $RESULT_GEM_HOME
if [ "$RESULT_GEM_HOME" = "$GEM_HOME_INSTALL" ]; then 
    echoInfo "Test - RubyGems Home Installation: SUCCESS"
else
    echoError "Test - RubyGems Home Installation: FAILED"
    exit 1
fi

exit 0