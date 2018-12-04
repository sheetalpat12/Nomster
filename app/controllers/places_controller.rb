class PlacesController < ApplicationController

  def index
     @places = Place.order("id").page(params[:page]).per_page(5)
     # @places = Place.search(params[:name], params[:page])
  end

  def new
    @place = Place.new
  end

end
