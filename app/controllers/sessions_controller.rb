class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to collaborations_index
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to collaborations_path, :notice => "Logged in!"
    else
      redirect_to root_url, :alert => "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
