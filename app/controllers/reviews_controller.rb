class ReviewsController < ApplicationController
  use Rack::Flash

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
    review = Review.new(params[:review])
    if review.save
      user.reviews << review
      redirect '/reviews'
    else
      flash[:message] = "Please fill out the form to continue"
      redirect '/reviews/new'
    end
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
    review.update(rating: params[:review][:rating])
    review.update(content: params[:review][:content])
    review.update(category: params[:review][:category])
    if review.save
      redirect '/reviews'
    else
      flash[:message] = "Please edit the form to continue"
      redirect "/reviews/#{review.slug}/edit"
    end
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