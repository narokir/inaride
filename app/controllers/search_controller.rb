class SearchController < ApplicationController
  def search_rides
    if params.present?
      @rides=Ride.search(params)
      else
        respond_to do |format|
          format.html { redirect_to signin_url, notice: 'Please Sign in first' }
          #format.json { render json: @rides }
        end
    end
  end

  def ride_count
    @rides=Ride.count(@rides)
  end

end
