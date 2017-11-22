class UsersController < ApplicationController
  use Rack::Flash

  get '/login' do
    if logged_in?
      redirect '/reviews'
    else
      erb :'user/login'
    end
  end

  post '/login' do
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect '/reviews'
    else
      flash[:message] = "No account found"
      erb :'user/login'
    end
  end

  get '/signup' do
    if logged_in?
      redirect '/reviews'
    else
      erb :'/user/signup'
    end
  end

  post '/signup' do
    user = User.create(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect '/reviews'
    else
      flash[:message] = "Please fill out the form"
      erb :'/user/signup'
    end
  end

  get '/logout' do
    session.clear
    redirect "/"
  end
end