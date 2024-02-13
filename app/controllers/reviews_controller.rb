class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie
  before_action :set_review, only: [:edit, :update, :destroy]

  def create
    if current_user != @movie.user
      @review = @movie.reviews.new(review_params)
      @review.user = current_user
      
      if @review.save
        redirect_to @movie, notice: 'Review was successfully created.'
      else
        redirect_to @movie, alert: 'Review could not be saved.'
      end
    else
      redirect_to @movie, alert: 'You cannot give a review for your own movie.'
    end
  end

  def edit
    
  end

  def update
    if @review.update(review_params)
      redirect_to @movie, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to @movie, notice: 'Review was successfully deleted.'
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_review
    @review = @movie.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
