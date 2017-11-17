class ReviewsController < ApplicationController

  get '/reviews' do
    if logged_in?
      @user = current_user
      erb :'/reviews/index'
    else
      redirect '/'
    end
  end

  get '/reviews/new' do
    erb :'/reviews/new'
  end

  post '/reviews' do
    user = User.find(session[:user_id])
    user.reviews.create(params[:review])
    redirect '/reviews'
  end

  get '/reviews/:slug/edit' do
    @review = Review.find_by_slug(params[:slug])
    if current_user.id == @review.user_id
      erb :'/reviews/edit'
    else
      redirect :'/reviews'
    end
  end

  delete '/reviews/:slug/delete' do
    review = Review.find_by_slug(params[:slug])
    review.destroy
    redirect '/reviews'
  end

  patch '/reviews/:slug/edit' do
    review = Review.find_by_slug(params[:slug])
    review.update(params[:review])
    redirect '/reviews'
  end

  get '/reviews/:slug' do
    @review = Review.find_by_slug(params[:slug])
    erb :'/reviews/show'
  end

  get '/reviews/user/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/reviews/user'
  end



end