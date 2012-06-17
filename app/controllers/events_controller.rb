class EventsController < ApplicationController
  def index
	@events=Event.all
  end

  def show
	@event = Event.find(params[:id])
  end

  def new
	@event = Event.new
	
	
  end

  def create
	@event = Event.new(params[:event])
	
    	if @event.save
          redirect_to user_place_event_path(@event, :place_id => @event.place_id, :user_id => Place.find_by_id(@event.place_id).user_id)
    	else
          redirect_to new_user_place_event_path(@event, :place_id => @event.place_id, :user_id => Place.find_by_id(@event.place_id).user_id)
    	end
  end

  def edit
	@event = Event.find(params[:id])
  end

  def update
	
	@event = Event.find(params[:id])
	@event.rating = params[:rating].to_i
    	if @event.update_attributes(params[:event])
          redirect_to user_place_event_path(@event, :place_id => @event.place_id, :user_id => Place.find_by_id(@event.place_id).user_id)
    	else
          redirect_to edit_user_place_event_path(@event, :place_id => @event.place_id, :user_id => Place.find_by_id(@event.place_id).user_id)
    	end
  end


  def destroy
	Event.find_by_id(params[:id]).try(:destroy)
   	redirect_to places_path
  end

  def rate
	@event = Event.find(params[:id])
	
  end

  


end
