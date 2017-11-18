require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Sass::Plugin::Rack
Sass::Plugin.options[:style] = :compressed
configure :production do
  use Rack::Static,
      urls: ['/stylesheets'],
      root: File.expand_path('../tmp', __FILE__)

  Sass::Plugin.options.merge!(template_location: 'public/stylesheets/sass',
                              css_location: 'tmp/stylesheets')
end

use Rack::MethodOverride
use ReviewsController
use UsersController
run ApplicationController
