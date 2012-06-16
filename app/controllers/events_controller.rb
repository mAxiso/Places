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
          redirect_to @event
    	else
          render :new
    	end
  end

  def edit
	@event = Event.find(params[:id])
  end

  def update
	
	@event = Event.find(params[:id])
	@event.rating = params[:rating].to_i
    	if @event.update_attributes(params[:event])
          redirect_to @event
    	else
          render :edit
    	end
  end


  def destroy
	Event.find_by_id(params[:id]).try(:delete)
   	redirect_to events_path
  end

  def rate
	@event = Event.find(params[:id])
	
  end
end
