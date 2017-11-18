require './config/environment'
require 'sass/plugin/rack'

class ApplicationController < Sinatra::Base
  use Sass::Plugin::Rack
  configure do
    enable :sessions
    set :session_secret, "review_secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  configure :production do
    use Rack::Static,
        urls: ['/stylesheets'],
        root: File.expand_path('../tmp', __FILE__)

    Sass::Plugin.options.merge!(template_location: 'public/stylesheets/sass',
                                css_location: 'tmp/stylesheets')
  end

  get '/' do
    erb :'index'
  end

  # Helpers
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end