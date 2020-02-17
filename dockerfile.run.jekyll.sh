#!/bin/sh
set -eu

echo 'gem: --no-document --no-ri --no-rdoc' > /etc/gemrc

echo "Running Jekyll Install"
TRACE_START=$(date +%s)
gem install jekyll --silent -- --use-system-libraries -​-clear-sources
TRACE_END=$(date +%s)
ELAPSED_TIME=$(($TRACE_END - $TRACE_START))
echo "Jekyll install took: $(($ELAPSED_TIME/60)) min $(($ELAPSED_TIME%60)) sec"    

echo "Running Bundler Install"
gem install bundler --silent -- --use-system-libraries -​-clear-sources 

echo "Running cleaning routines"
gem sources -c
rm -rf $GEM_HOME/cache