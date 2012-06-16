class PlacesController < ApplicationController
  def index
	@places=Place.all
	
			
  end

  def show
	@place = Place.find(params[:id])
  end

  def new
	@place = Place.new
  end

  def create
	@place = Place.new(params[:place])
    	if @place.save
          redirect_to @place
    	else
          render :new
    	end
  end

  def edit
	@place = Place.find(params[:id])
	
  end

  def update
	@place = Place.find(params[:id])
	
    	if @place.update_attributes(params[:place])
          redirect_to @place
    	else
          render :edit
    	end
  end

  

  def destroy
	Place.find_by_id(params[:id]).try(:delete)
   	redirect_to places_path
  end
end
