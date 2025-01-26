#!/bin/sh
npm install
bundle install
bundle exec jekyll build
gulp
