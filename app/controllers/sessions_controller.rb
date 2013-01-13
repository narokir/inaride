class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end 
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
  def facebook_login
    #raise request.env["omniauth.auth"].to_yaml
    #raise request.env["omniauth.auth"].extra.raw_info.gender
    user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_back_or user
  end
  
end

