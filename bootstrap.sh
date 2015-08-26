#!/usr/bin/env bash

## Change this to whatever you want to name your new app
# RAILS_APP=railsapp

## Aditional system tools
sudo apt-get update
sudo apt-get install -y git

# Project uses rubyracer
# sudo apt-get install -y nodejs

# Does not appear to use an image uploading gem
# sudo apt-get install -y imagemagick

sudo apt-get install -y libsqlite3-dev
sudo apt-get install -y sqlite3
sudo apt-get install -y build-essential
sudo apt-get install -y libffi-dev

# This app uses Postgres in production, and bundle install
# will not succeed if it is not installed (unless using --without production flag)
sudo apt-get install libpq-dev

## Install rbenv and rbenv-build to manage ruby environment
su - vagrant -c "git clone https://github.com/sstephenson/rbenv.git ~/.rbenv"
su - vagrant -c "echo 'export PATH=\"~/.rbenv/bin:$PATH\"' >> ~/.bash_profile"
su - vagrant -c "echo 'eval \"\$(rbenv init -)\"' >> ~/.bash_profile"
su - vagrant -c "git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build"

## Install Ruby 2.2.1
su - vagrant -c "rbenv install 2.2.1"
su - vagrant -c "rbenv global 2.2.1"
su - vagrant -c "rbenv rehash"

## Install Rails 4.2.0
# su - vagrant -c "gem install rails -v 4.2.0"

# Install bundler
su - vagrant -c "gem install bundler"
su - vagrant -c "rbenv rehash"

## Setup new app
# su - vagrant -c "mkdir -p /vagrant/$RAILS_APP"
# su - vagrant -c "rails new /vagrant/$RAILS_APP"
