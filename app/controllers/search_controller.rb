class SearchController < ApplicationController
  layout :choose_layout
  
  def idex
    @rides = Ride.paginate(:page => params[:page], :per_page => 10)
  end
  
  def search_rides
    if params[:origin].present? || params[:destination].present? || params[:date].present?
      @rides=Ride.search(params).limit(10)
      respond_to do |format|
	format.html { render 'results' }
      end
    else
      render 'results'
      flash.now[:info] = "No params given"
    end
  end
  
  private  
  def choose_layout  
    (request.xhr?) ? 'search_results' : 'application'
  end 

end
