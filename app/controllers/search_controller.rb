class SearchController < ApplicationController
  
  def search_rides
    if params.present?
      @rides=Ride.search(params).limit(10)
    else
      #TODO: add condition fow when no rides found

    end
  end

end
