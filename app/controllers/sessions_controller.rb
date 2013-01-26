class SessionsController < ApplicationController
  layout :choose_layout
  
  def new
    @user = User.new
  end
  
  def create
    #store_location
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      respond_to do |format|  
        format.html { redirect_back_or root_url }  
        format.js
      end
    else
      respond_to do |format|
	format.html do
	  flash.now[:error] = 'Invalid email/password combination'
	  render 'new'
	end
	format.js do
	  render :js => "$('<p>Invalid email password combination</p>').prependTo('#login-errors');"
	end
      end
    end 
  end
  

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
  def facebook_login
    #raise request.env["omniauth.auth"].to_yaml
    #raise request.env["omniauth.auth"].extra.raw_info.gender
    @user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id
      respond_to do |format|
	format.html { redirect_back_or @user }
	format.js { render :js => "alert('Facebook')" }
      end
  end
  
  private  
  def choose_layout  
    (request.xhr?) ? 'signin' : 'application'
  end 
  
end

