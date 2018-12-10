class PlacesController < ApplicationController
 before_action :authenticate_user!, only: [:new, :create, :edit, :update]

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

  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
    end

  end

  def update
    @place = Place.find(params[:id])

    if @place.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
    end
    
    @place.update_attributes(place_params)
    redirect_to root_path
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to root_path
  end
end
