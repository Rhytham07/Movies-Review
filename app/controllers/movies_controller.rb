class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @movies = Movie.page(params[:page]).per(5)
  end

  def show
    # @review = Review.new(movie: @movie)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params.merge(user_id: current_user.id))

    if @movie.save
      UserMailer.with(user: current_user).registration_confirmation.deliver
      redirect_to @movie, notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @movie
  end

  def update
    authorize @movie

    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @movie

    if @movie.destroy
      redirect_to movies_url, notice: 'Movie was successfully deleted.'
    else
      redirect_to movies_path, notice: 'You cannot delete this movie.'
    end
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :picture)
  end
end
