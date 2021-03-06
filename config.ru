require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Sass::Plugin::Rack
use Rack::MethodOverride
use ReviewsController
use UsersController
use CommentsController
run ApplicationController
