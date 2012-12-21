class SearchController < ApplicationController
  
  def search_rides
    if params.present?
      @rides=Ride.search(params).limit(10)
    else
      scoped
    end
  end

end
