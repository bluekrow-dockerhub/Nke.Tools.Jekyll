#!/bin/sh

echoInfo () {
	echo "\e[92m$1\e[0m"
}

echoError () {
	echo "\e[91m\e[5m$1\e[0m"
}

execute_test()
{
    EXPECTED_VALUE=$1
    ACTUAL_VALUE=$2
    TEST_TITLE=$3
    echo
    echo TEST: $TEST_TITLE
    echo "Expected value: $EXPECTED_VALUE"
    echo "Actual value: $ACTUAL_VALUE"
    if [ "$ACTUAL_VALUE" = "$EXPECTED_VALUE" ]; then 
        echoInfo "Test result: SUCCESS"
    else
        echoError "Test result: FAILED"
        exit 1
    fi
}

echo
echo ------------------
echo INITIALIZE TESTING
echo ------------------
#Check Ubuntu installation
NIX_TITLE="INSTALLED_OS"
NIX_OS="ubuntu"
RESULT_OS=$(cat /etc/os-release | grep '^ID=' | sed -e 's/^ID=//' )
execute_test $NIX_OS $RESULT_OS $NIX_TITLE

#Check Distro installation
NIX_DIST_TITLE="INSTALLED_DISTRIBUTION"
NIX_DIST="eoan"
RESULT_DIST=$(cat /etc/os-release | grep '^VERSION_CODENAME=' | sed -e 's/^VERSION_CODENAME=//' )
execute_test $NIX_DIST $RESULT_DIST $NIX_DIST_TITLE

#Check Ruby installation
RUBY_TITLE="RUBY_INSTALLATION"
RUBY_INSTALL="ruby"
RESULT_RUBY=$(ruby --version | sed -e 's/\ .*//')
execute_test $RUBY_INSTALL $RESULT_RUBY $RUBY_TITLE

echo
#Check Gems installation
echo "TEST: GEMS_INSTALLATION"
RESULT_GEMS=$(gem --version)
echo Existent Value: $RESULT_GEMS
if [ -n "$RESULT_GEMS" ]; then 
    echoInfo "Test result: SUCCESS"
else
    echoError "Test result: FAILED"
    exit 1
fi

#Check Gems Home installation
GEM_HOME_TITLE="GEM_HOME_CONFIGURATION"
GEM_HOME_INSTALL="/usr/local/bundle"
RESULT_GEM_HOME=$GEM_HOME
execute_test $GEM_HOME_INSTALL $RESULT_GEM_HOME $GEM_HOME_TITLE

#Check Jekyll installation
JEKYLL_TITLE="JEKYLL_INSTALLATION"
JEKYLL_INSTALL="jekyll"
RESULT_JEKYLL=$(jekyll --version | sed -e 's/\ .*//')
execute_test $JEKYLL_INSTALL $RESULT_JEKYLL $JEKYLL_TITLE

#Check Bundler installation
BUNDLER_TITLE="BUNDLER_INSTALLATION"
BUNDLER_INSTALL="Bundler"
RESULT_BUNDLER=$(bundler --version | sed -e 's/\ .*//')
execute_test $BUNDLER_INSTALL $RESULT_BUNDLER $BUNDLER_TITLE

exit 0