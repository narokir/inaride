class SearchController < ApplicationController
  
  def search_rides
    if params[:origin].present? || params[:destination].present? || params[:date].present?
      @rides=Ride.search(params).limit(10)
      render 'results'
    else
      render 'results'
      flash.now[:info] = "No params given"
    end
  end

end
