ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/development')

require_all 'app'
