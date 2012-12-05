class SearchController < ApplicationController


  def search_rides
    if params.present?
      @rides=Ride.search(params)
    else
      #TODO: add condition fow when no rides found

    end
  end

end
