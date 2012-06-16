class UsersController < ApplicationController
  def index
	@users=User.all
  end

  def show
	@user = User.find(params[:id])
  end

  def new
	@user = User.new
  end

  def create
	@user = User.new(params[:user])
	
    	if @user.save
          redirect_to places_path
    	else
          render :new
    	end
  end

  def edit
	@user = User.find(params[:id])
  end

  def update
	@User = User.find(params[:id])
	
    	if @user.update_attributes(params[:user])
          redirect_to @user
    	else
          render :edit
    	end
  end

  def destroy
	User.find_by_id(params[:id]).try(:delete)
   	redirect_to users_path
  end

  def places
    @places = User.find_by_id(params[:id]).places
    render 'places/index'
  end
end