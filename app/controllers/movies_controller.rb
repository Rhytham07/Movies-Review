class MoviesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
  
    def index
      @movies = Movie.page(params[:page]).per(10)
    end
  
    def show
      @movie = Movie.find(params[:id])
      @review = Review.new(movie: @movie)
    end
  
    def new
      @movie = Movie.new
    end
  
    def create
      @movie = Movie.new(movie_params)
      if @movie.save
        redirect_to @movie, notice: 'Movie was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def movie_params
      params.require(:movie).permit(:title, :description, :picture)
    end
  end
  