class CommentsController < ApplicationController
  post '/reviews/:slug/comments' do
    if logged_in?
      if @review = Review.find_by_slug(params[:slug])
        comment = @review.comments.create(content: params[:comment][:content], user: current_user)
        if comment.save
          flash[:message] = "Successfully submitted a comment"
          redirect to "/reviews/#{@review.slug}"
        else
          flash[:message] = "Please add a comment"
        end
        redirect to "/reviews/#{@review.slug}"
      else
        redirect to '/reviews'
      end
    else
      redirect '/login'
    end
  end
end

# @lukeghenco
# Slack @luke