class StaticPagesController < ApplicationController
  def home
    @rides = Ride.all(limit: 5)
  end

  def help
  end
  
  def about
  end
  
  def contac
  end
  
  def signup
  end
  
  def signin
  end
  
end
