class SearchController < ApplicationController
  
  def search_rides
    if params[:origin].present? || params[:destination].present? || params[:date].present?
      @rides=Ride.search(params).limit(10)
      render 'results'
    else
      render 'results', notice: 'Sorry no rides found'
    end
  end

end
