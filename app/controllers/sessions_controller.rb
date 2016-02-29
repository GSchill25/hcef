class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      if user.role == "instructor" && user.active == false
        redirect_to home_path, notice: "Your account has been deactivated. Please contact system administrator."
      else
        session[:user_id] = user.id
        redirect_to home_path, notice: "You are logged into the system."
      end
    else
      flash.now[:alert] = "Username or password is invalid."
      render action: 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path, notice: "You have been logged out."
  end
end
