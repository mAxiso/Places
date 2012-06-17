class PlacesController < ApplicationController
  def index
	if current_user == nil
		redirect_to root_path
	else
		@places=Place.all
	end
	
			
  end

  def show
	if current_user == nil
		redirect_to root_path
	else
		@place = Place.find(params[:id])
	end
  end

  def new
	if current_user == nil
		redirect_to root_path
	else
		@place = Place.new
	end
  end

  def create
	if current_user == nil
		redirect_to root_path
	else	
	 	@place = Place.new(params[:place])
	
   	 	if @place.save
        	  redirect_to user_place_path(@place, :user_id => @place.user_id)
    		else
        	  redirect_to new_user_place_path(@place, :user_id => @place.user_id)
    		end
	end  
  end

  def edit
	if current_user == nil
		redirect_to root_path
	else
		@place = Place.find(params[:id])
	end
  end

  def update
	if	
		@place = Place.find(params[:id])
	
	    	if @place.update_attributes(params[:place])	
          		redirect_to user_place_path(@place, :user_id => @place.user_id)
    		else
        		  redirect_to edit_user_place_path(@place, :user_id => @place.user_id)
    		end
	end
  end

  

  def destroy
	if current_user == nil
		redirect_to root_path
	else	
		Place.find_by_id(params[:id]).try(:destroy)
   		redirect_to places_path
	end
  end
  def events
    @events = Place.find_by_id(params[:id]).events
    render 'events/index'
  end
end
