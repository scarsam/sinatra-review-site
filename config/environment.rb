require 'bundler/setup'
Bundler.require
require 'sinatra/activerecord/rake'
require 'rack-flash'
require 'sass/plugin/rack'
require_all 'app'
