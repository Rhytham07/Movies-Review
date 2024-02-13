class StarCastsController < ApplicationController
    before_action :set_star_cast, only: [:show, :update]
      before_action :set_movie, only: [:new, :create]

  
    def index
      @star_casts = StarCast.all
    end
  
    def show
      # This will render app/views/star_casts/show.html.erb
    end
  
    def new
      @star_cast = StarCast.new
    end
  
    def create 
      @star_cast = @movie.star_cast.build(star_cast_params)

      if @star_cast.save
        redirect_to root_path, notice: 'Star Cast was successfully created.'
      else
        render :new
      end
    end
  
    def update
      if @star_cast.update(star_cast_params)
        redirect_to @star_cast, notice: 'Star Cast was successfully updated.'
      else
        render :edit
      end
    end
  
    private
      def set_star_cast
        binding.pry
        @star_cast = StarCast.find(params[:id])
      end

     def set_movie
      @movie = Movie.find(params[:movie_id])
      unless @movie
        redirect_to movies_path, alert: 'Movie not found.'
      end
    end
  
      def star_cast_params
        params.require(:star_cast).permit(:role_name, :name , :cast_id, :movie_id)
      end
  end
  