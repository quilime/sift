#!/bin/sh

DIR=`dirname "$0"`

cd $DIR
ruby build.rb
jekyll build -d /var/www/sift.elev.us/
