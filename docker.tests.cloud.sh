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

echo
#Check Jekyll installation
JEKYLL_INSTALL="jekyll"
RESULT_JEKYLL=$(jekyll --version | sed -e 's/\ .*//')
echo Expected Software: $JEKYLL_INSTALL
echo Actual Software: $RESULT_JEKYLL
if [ "$RESULT_JEKYLL" = "$JEKYLL_INSTALL" ]; then 
    echoInfo "Test - Jekyll Installation: SUCCESS"
else
    echoError "Test - Jekyll Installation: FAILED"
    exit 1
fi

echo
#Check Bundler installation
BUNDLER_INSTALL="Bundler"
RESULT_BUNDLER=$(bundler --version | sed -e 's/\ .*//')
echo Expected Software: $BUNDLER_INSTALL
echo Actual Software: $RESULT_BUNDLER
if [ "$RESULT_BUNDLER" = "$BUNDLER_INSTALL" ]; then 
    echoInfo "Test - Bundler Installation: SUCCESS"
else
    echoError "Test - Bundler Installation: FAILED"
    exit 1
fi

exit 0