#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake db:migrate VERSION=0
bundle exec rake db:migrate
bundle exec rake db:seed