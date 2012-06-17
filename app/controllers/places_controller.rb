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
          redirect_to user_place_path(@place, :user_id => @place.user_id)
    	else
          redirect_to new_user_place_path(@place, :user_id => @place.user_id)
    	end
  end

  def edit
	@place = Place.find(params[:id])
	
  end

  def update
	@place = Place.find(params[:id])
	
    	if @place.update_attributes(params[:place])
          redirect_to user_place_path(@place, :user_id => @place.user_id)
    	else
          redirect_to edit_user_place_path(@place, :user_id => @place.user_id)
    	end
  end

  

  def destroy
	Place.find_by_id(params[:id]).try(:delete)
   	redirect_to places_path
  end
  def events
    @events = Place.find_by_id(params[:id]).events
    render 'events/index'
  end
end
