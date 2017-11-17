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

  get '/reviews/:id/edit' do
    @review = Review.find(params[:id])
    if current_user.id == @review.id
      erb :'/reviews/edit'
    else
      redirect :'/reviews'
    end
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