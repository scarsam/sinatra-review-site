require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::Static,
    :urls => ["/images", "/js", "/stylesheets"],
    :root => "public"
run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    }
  ]
}

Sass::Plugin.options[:style] = :compressed

use Sass::Plugin::Rack
use Rack::MethodOverride
use ReviewsController
use UsersController
run ApplicationController
