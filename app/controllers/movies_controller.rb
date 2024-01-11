class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.page(params[:page]).per(5)
  end

  def show
    @review = Review.new(movie: @movie)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
      redirect_to @movie, notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @movie.present? && @movie.user_id == current_user.id
      if @movie.update(movie_params)
        redirect_to @movie, notice: 'Movie was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to movies_path, notice: "you are not authorised to update this movie"
    end
  end

  def destroy
    if @movie.present? && @movie.user_id == current_user.id
      @movie.destroy
      redirect_to movies_url, notice: 'Movie was successfully deleted.'
    else
      redirect_to movies_path, notice: "you cant able to deleted this movie"
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :picture)
  end
end
