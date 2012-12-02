class SessionsController < ApplicationController
  
  def new
  end
  
  def create(default = root_url)
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    if !request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to default
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end

