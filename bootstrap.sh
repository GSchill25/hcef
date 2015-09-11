#!/usr/bin/env bash

## Change this to whatever you want to name your new app
RAILS_APP=railsapp

## Aditional system tools
sudo apt-get update
sudo apt-get install -y git

sudo apt-get install -y nodejs # Project will no longer use rubyracer

# Project does not appear to use an image uploading gem
# sudo apt-get install -y imagemagick

sudo apt-get install -y libsqlite3-dev
sudo apt-get install -y sqlite3
sudo apt-get install -y build-essential
sudo apt-get install -y libffi-dev

# Install and configure MySQL server
sudo apt-get install -y libmysqlclient-dev
sudo apt-get install -y debconf-utils
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password MySuperPassword'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password MySuperPassword'
sudo apt-get install -y mysql-server

# sudo apt-get install libpq-dev # This app will no longer pretend to use postgreSQL in production

## Install rbenv and rbenv-build to manage ruby environment
su - vagrant -c "git clone https://github.com/sstephenson/rbenv.git ~/.rbenv"
su - vagrant -c "echo 'export PATH=\"~/.rbenv/bin:$PATH\"' >> ~/.bash_profile"
su - vagrant -c "echo 'eval \"\$(rbenv init -)\"' >> ~/.bash_profile"
su - vagrant -c "git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build"

## Install Ruby 2.2.1 (ruby version not specified in project bit this version seems to work)
su - vagrant -c "rbenv install 2.2.1"
su - vagrant -c "rbenv global 2.2.1"
su - vagrant -c "rbenv rehash"

## Install Rails 4.2.0
# su - vagrant -c "gem install rails -v 4.2.0" # Rails app already contained in repo

# Install bundler
su - vagrant -c "gem install bundler"
su - vagrant -c "rbenv rehash"

## Setup new app (app already exists, skip this)
# su - vagrant -c "mkdir -p /vagrant/$RAILS_APP"
# su - vagrant -c "rails new /vagrant/$RAILS_APP"
