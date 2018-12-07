class PlacesController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]

  def index
     @places = Place.order("id").page(params[:page]).per_page(5)
     # @places = Place.search(params[:name], params[:page])
  end

  def new
    @place = Place.new
  end

  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

  def show
    @place = Place.find(params[:id])
  end
end
