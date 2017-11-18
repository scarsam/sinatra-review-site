require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

Sass::Plugin.options[:style] = :compressed

use Rack::MethodOverride
use ReviewsController
use UsersController
run ApplicationController
