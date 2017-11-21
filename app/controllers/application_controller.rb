require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::Sprockets::Helpers
  register Sinatra::AssetPipeline
  set :sprockets, Sprockets::Environment.new('app')
  set :assets_prefix, '/assets'
  set :digest_assets, true

  configure do
    enable :sessions
    set :session_secret, "review_secret"
    set :public_folder, 'public'
    set :views, 'app/views'
    sprockets.append_path File.join('app', 'assets', 'stylesheets')
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