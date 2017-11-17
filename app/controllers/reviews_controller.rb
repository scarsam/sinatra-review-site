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

  get '/reviews/:id/edit' do
    @review = Review.find(params[:id])
    if current_user.id == @review.user_id
      erb :'/reviews/edit'
    else
      redirect :'/reviews'
    end
  end

  delete '/reviews/:id/delete' do
    review = Review.find(params[:id])
    review.destroy
    redirect '/reviews'
  end

  patch '/reviews/:id/edit' do
    review = Review.find(params[:id])
    review.update(params[:review])
    redirect '/reviews'
  end

  get '/reviews/:id' do
    @review = Review.find(params[:id])
    erb :'/reviews/show'
  end

end