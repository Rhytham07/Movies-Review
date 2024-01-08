class ReviewsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @movie = Movie.find(params[:movie_id])
      @review = @movie.reviews.new(review_params)
      @review.user = current_user
  
      if @review.save
        redirect_to @movie, notice: 'Review was successfully created.'
      else
        redirect_to @movie, alert: 'Review could not be saved.'
      end
    end
  
    private
  
    def review_params
      params.require(:review).permit(:content, :rating)
    end
  end
  