class SessionsController < ApplicationController
  
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
<<<<<<< HEAD
    redirect_to(request.env["HTTP_REFERER"])
=======
    redirect_to new_ride_url
>>>>>>> map-markers
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end

