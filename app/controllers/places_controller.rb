class PlacesController < ApplicationController

  def index
    @places = Place.all
    @firstplaces = Place.first

  end
end
