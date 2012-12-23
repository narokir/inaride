class SearchController < ApplicationController
  
  def search_rides
    if params[:origin].present? || params[:destination].present? || params[:date].present?
      @rides=Ride.search(params).limit(10)
    else
      render 'rides'
      flash[:error] = "no params"
    end
  end

end
