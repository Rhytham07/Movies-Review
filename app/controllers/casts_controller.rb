class CastsController < ApplicationController
  before_action :set_cast, only: [:show, :update]
  before_action :set_movie, only: [:new, :create]

  def index
    @casts = Cast.all
  end

  def show

  end

  def new
    @cast = Cast.new
  end

  def create
    @cast = Cast.new(cast_params)

    if @cast.save
      redirect_to @cast, notice: 'Cast was successfully created.'
    else
      render :new
    end
  end

  def update
    if @cast.update(cast_params)
      redirect_to @cast, notice: 'Cast was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_cast
    @cast = Cast.find(params[:id])
  end

  def cast_params
    params.require(:cast).permit(:first_name, :last_name, :date_of_birth, :place_of_birth, :biography, :gender, :nationality, :height, :weight, :social_media_links, :profile_picture)
  end

  def set_movie
    @movie = Movie.find_by_id(params[:movie_id])
  end
end
