class PlacesController < ApplicationController

  def index
     @places = Place.order("id").page(params[:page]).per_page(5)
     # @places = Place.search(params[:name], params[:page])
  end

  def new
    @place = Place.new
  end

  def create
    Place.create(place_params)
    redirect_to root_path
  end

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end
end
