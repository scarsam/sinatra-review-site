require './config/environment'

class ApplicationController < Sinatra::Base
  set :sprockets, Sprockets::Environment.new('./')
  set :assets_precompile, %w(application.css *.png *.jpg *.svg *.eot *.ttf *.woff *.woff2)
  set :assets_prefix, '/assets'
  set :assets_paths, %w(../../assets)
  set :assets_css_compressor, :sass
  register Sinatra::AssetPipeline
  register Sinatra::Sprockets::Helpers
  configure do
    enable :sessions
    set :session_secret, "review_secret"
    set :public_folder, 'public'
    set :views, 'app/views'
    sprockets.append_path File.join(sprockets.root, '/assets', 'stylesheets')
    Sprockets::Helpers.configure do |config|
      config.environment = sprockets
      config.prefix      = assets_prefix
      config.public_path = public_folder
    end
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