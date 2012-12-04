class SessionsController < ApplicationController
  
  def new
  end
  
  def create(default=root_path)
    user = User.from_omniauth(env["omniauth.auth"])
    if !request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      flash[:success] = "Nice! Welcome to Innoride"
      redirect_to :back
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end

