require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, "review_secret"
    set :public_folder, File.join('app', 'public')
    set :views, 'app/views'
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