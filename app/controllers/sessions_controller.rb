class SessionsController < ApplicationController
  def new
  end

  

  def create
    if current_user
	redirect_to current_user_path
    else

	    user = User.find_by_email params[:email]
	    if user && user.authenticate(params[:password])
      		session[:user_id] = user.id
      		redirect_to user_path(user) , notice: "Logged in!"
    	    else
      		redirect_to root_path, notice: "Email or password is invalid"
    	    end
    end
  end


   def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
