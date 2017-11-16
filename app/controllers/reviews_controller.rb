class ReviewsController < ApplicationController

  get '/reviews' do
    if logged_in?
      erb :'/reviews/index'
    else
      redirect '/'
    end
  end

end