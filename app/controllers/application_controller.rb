class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  #def store_location
  #  session[:return_to] = request.url
  #end
  
  def store_location
    session[:return_to] =
    if request.get?
      request.url
    else
      request.referer
    end
  end
  
  def signed_in_user
    unless signed_in?
      store_location
      session[:params] = params
      #redirect_to signin_url, notice: "Please sign in"
      render '/shared/_signin'
      #render :js => "$('#signinModal').modal(show);"
      #@js = "$(function () { $('#signinModal').modal();});"
      #render :inline => "<%= javascript_tag(@js) %>"
    end
  end
end
