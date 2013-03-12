class StaticPagesController < ApplicationController
  
  def home
    @rides = Ride.all(limit: 6)
    #@ride = current_user.rides.build if signed_in?
  end

  def help
  end
  
  def index
  end
  
  def about
    
  end
  
  def contac
  end
  
  def signup
  end

  def find_rides
    @rides = Ride.all(limit: 6)
    if signed_in?
      #@rides  = current_user.rides.build
      #@feed_items = current_user.feed.paginate(page: params[:page])
    end
    # see if this will help with ride creation on home page
    @ride = current_user.rides.build if signed_in?
  end
  
  def signin
    if session[:user_id].present?
      respond_to do |format|
        format.html { redirect_to new_ride_path, notice: 'Hey there' }
        format.json { render json: @ride }
      end
    end
  end


end
