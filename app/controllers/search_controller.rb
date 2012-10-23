class SearchController < ApplicationController
  def search_rides
    if params.present?
      @rides=Ride.search(params)
    else

    end
  end

end
