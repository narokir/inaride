class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    #store_location
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      
      respond_to do |format|  
        format.html { redirect_back_or root_url }  
        format.js #{ render :js => "$('.modal').modal('hide')" } # JavaScript to do the redirect  
      end
      
    sign_in user
      
    else
      respond_to do |format|  
        format.html { render 'new' }
        flash.now[:error] = 'Invalid email/password combination'
        format.js { render :js => "$('.modal').modal('hide')" } # JavaScript to do the redirect  
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
    user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_back_or user
  end
  
end

