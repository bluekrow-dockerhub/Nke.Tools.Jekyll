#!/bin/sh
set -eu

echo 'gem: --no-document --no-ri --no-rdoc' > /etc/gemrc

echo "Running Jekyll Install"
gem install jekyll -- --use-system-libraries

echo "Running Bundler Install"
gem install bundler -- --use-system-libraries

echo "Running cleaning routines"
rm -rf /gems/cache/*.gem
rm -rf /root/.gem
rm -rf /home/jekyll/.gem
rm -rf $BUNDLE_HOME/cache
rm -rf $GEM_HOME/cache